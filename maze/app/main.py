import sys

from .maze import Maze
from .socket import Server
from .display import Display
from .controller import Controller

HOST = '0.0.0.0'

def start():
    max_x, max_y = 10, 10

    padding = 5
    aspect_ratio = max_x / max_y

    height = 250
    width = int(height * aspect_ratio)

    maze = Maze(max_x, max_y)
    maze.make_maze()

    display = Display(height=height, width=width, padding=padding)
    server = Server(HOST, 1234)

    Controller.init(2)

    task_display = Controller.start(display.run, maze)
    task_server = Controller.start(server.run, maze)

    while True:
        command = input("command:")
        if (command == "set_end"):
            x = int(input("new X:"))
            y = int(input("new Y:"))
            maze.set_end(x, y)
            print("new end!")

        elif (command == "walk"):
            if (maze.subject.walk()):
                print("walked")
            else:
                print("not walked")

        elif (command == "left"):
            maze.subject.turn_left()
            print("turn left")

        elif (command == "right"):
            maze.subject.turn_right()
            print("turn right")

        elif (command == "reset"):
            maze.subject.reset()
            print("reset maze")

        else:
            print("comando invalido")

    sys.exit()
