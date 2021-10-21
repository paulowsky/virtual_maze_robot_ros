import asyncio
import socket
import pickle
import json
import struct
import cv2
import time

WALL = cv2.resize(cv2.imread("img/wall.jpg"), (500, 500))
CORREDOR = cv2.resize(cv2.imread("img/corredor.jpg"), (500, 500))


class Server:
    def __init__(self, host, port, max=0) -> None:
        self.maze = None
        self.loop = None

        self.host = host
        self.port = port
        self.max = max

        self._clients = {}

    async def _cam(self, client: socket.socket):
        await asyncio.sleep(2)
        _moviments = -1
        while client.fileno() != -1:
            x, y, direction = self.maze.subject.current

            if (_moviments == self.maze.subject.moviments):
                await asyncio.sleep(0.5)
                continue
            _moviments = self.maze.subject.moviments
            x_o, y_o, directio_o = x, y, direction

            if (self.maze.cell_at(x, y).walls[direction]):
                img = pickle.dumps(WALL)
            else:
                img = pickle.dumps(CORREDOR)

            size = len(img)

            await self.loop.sock_sendall(client, struct.pack(">L", len(img)) + img)

            await asyncio.sleep(0.5)

    async def _motor(self, client: socket.socket):
        await asyncio.sleep(2)
        await self.loop.sock_sendall(client, pickle.dumps((self.maze.subject.current, self.maze.end)))
        while client.fileno() != -1:
            motion = (await self.loop.sock_recv(client, 255)).decode("utf8")
            if (motion == "walk"):
                self.maze.subject.walk()
                await self.loop.sock_sendall(client, pickle.dumps(self.maze.subject.current))

            elif (motion == "left"):
                self.maze.subject.turn_left()
                await self.loop.sock_sendall(client, pickle.dumps(self.maze.subject.current))

            elif (motion == "right"):
                self.maze.subject.turn_right()
                await self.loop.sock_sendall(client, pickle.dumps(self.maze.subject.current))
            else:
                raise ValueError(motion)

    async def _handle_client(self, client: socket.socket, addr):
        await self.loop.sock_sendall(client, "send::type".encode("utf8"))
        client_type = (await self.loop.sock_recv(client, 255)).decode('utf8')

        if (client_type == "cam"):
            await self.loop.sock_sendall(client, "type::cam".encode("utf8"))
            await self._cam(client)

        elif (client_type == "motor"):
            await self.loop.sock_sendall(client, "type::motor".encode("utf8"))
            await self._motor(client)

        else:
            raise ValueError(client_type)

        client.close()

    async def run(self, maze, loop):
        self.maze = maze
        self.loop = loop

        server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        server.bind((self.host, self.port))
        server.listen(self.max)
        server.setblocking(False)

        while True:
            client, addr = await self.loop.sock_accept(server)
            self.loop.create_task(self._handle_client(client, addr))
