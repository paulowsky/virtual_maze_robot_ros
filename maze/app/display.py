import pygame
import cv2

BACKGROUND = (255, 255, 255)
WALL = (0, 0, 0)

TRAIL = (169, 169, 169)

HEAD = (51, 102, 255)
BODY = (255, 0, 0)

START = (204, 255, 153)
END = (255, 204, 153)

WALL_IMG = cv2.resize(cv2.imread("img/wall.jpg"), (500, 500))
CORREDOR_IMG = cv2.resize(cv2.imread("img/corredor.jpg"), (500, 500))


class Display:
    def __init__(self, width, height, padding, delay=2) -> None:
        self.delay = 2

        self.width = width
        self.height = height
        self.padding = padding

        self.size = (width + 2 * padding, height + 2 * padding)

        self._screen = None
        self._clock = None
        self._font = None
        self._done = False

        self._size_wall = 2

    def quit(self):
        self._done = True
        pygame.quit()

    def _draw_walls(self, maze, max_x, max_y):
        scy, scx = self.height / max_y, self.width / max_x

        for x in range(max_x):
            for y in range(max_y):
                if maze.cell_at(x, y).walls['S']:
                    x1, y1, x2, y2 = x * scx, (y + 1) * scy, (x + 1) * scx, (y + 1) * scy
                    pygame.draw.line(self._screen, WALL, (x1, y1), (x2, y2), self._size_wall)

                if maze.cell_at(x, y).walls['E']:
                    x1, y1, x2, y2 = (x + 1) * scx, y * scy, (x + 1) * scx, (y + 1) * scy
                    pygame.draw.line(self._screen, WALL, (x1, y1), (x2, y2), self._size_wall)

        pygame.draw.line(self._screen, WALL, (0, 0), (self.height, 0), self._size_wall)
        pygame.draw.line(self._screen, WALL, (0, 0), (0, self.width), self._size_wall)

    def _draw_position(self, x, y, color, scx, scy):
        width = scx - self._size_wall
        height = scy - self._size_wall
        left = (x * scx) + self._size_wall
        top = (y * scy) + self._size_wall

        pygame.draw.rect(self._screen, color, (left, top, width, height))

    def _draw_header(self, x, y, direction, scx, scy):
        if (direction == 'S'):
            width = scx - self._size_wall
            height = (scy / 4)
            left = (x * scx) + self._size_wall
            top = ((y * scy) + 1 + height * 3)

        elif (direction == 'N'):
            width = scx - self._size_wall
            height = (scy / 4)
            left = (x * scx) + self._size_wall
            top = (y * scy) + self._size_wall

        elif (direction == 'E'):
            width = (scx / 4)
            height = scy - self._size_wall
            left = ((x * scx) + 1 + width * 3)
            top = (y * scy) + self._size_wall

        elif (direction == 'W'):
            width = (scx / 4)
            height = scy - self._size_wall
            left = (x * scx) + self._size_wall
            top = (y * scy) + self._size_wall

        pygame.draw.rect(self._screen, HEAD, (left, top, width, height))

    def _show_wall(self, maze):
        x, y, direction = maze.subject.current

        if (maze.cell_at(x, y).walls[direction]):
            TEXT = WALL_IMG.copy()
            cv2.putText(TEXT, f"({x}, {y}, {direction})", (0, 22), cv2.FONT_HERSHEY_SIMPLEX, 1, 1)
            cv2.imshow("watch", TEXT)
        else:
            TEXT = CORREDOR_IMG.copy()
            cv2.putText(TEXT, f"({x}, {y}, {direction})", (0, 22), cv2.FONT_HERSHEY_SIMPLEX, 1, 1)
            cv2.imshow("watch", TEXT)

    def _show_maze(self, maze):
        scy, scx = self.height / maze.max_y, self.width / maze.max_x

        self._draw_walls(maze, maze.max_x, maze.max_y)

        for x, y, _ in maze.subject.history:
            if ((x, y) != (0, 0)):
                self._draw_position(x, y, TRAIL, scx, scy)

        self._draw_position(*maze.end, END, scx, scy)
        self._draw_position(0, 0, START, scx, scy)

        x, y, direction = maze.subject.current

        text = self._font.render(f"({x}, {y}, {direction})", False, (0, 0, 0))
        self._screen.blit(text, (0, self.width))

        self._draw_position(x, y, BODY, scx, scy)
        self._draw_header(x, y, direction, scx, scy)

    async def run(self, maze, loop):
        if (self._screen is None):
            pygame.init()
            pygame.display.set_caption("maze")

            cv2.startWindowThread()
            cv2.namedWindow("watch")

        self._screen = pygame.display.set_mode(self.size)
        self._clock = pygame.time.Clock()
        self._font = pygame.font.SysFont('Comic Sans MS', 14)

        while not self._done:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    self._done = True

            self._screen.fill(BACKGROUND)

            self._show_maze(maze)
            self._show_wall(maze)

            pygame.display.flip()

            self._clock.tick(self.delay)

        pygame.quit()
        cv2.destroyAllWindows()
