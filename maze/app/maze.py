import random

from collections import defaultdict


class Subject:
    def __init__(self, maze: "Maze") -> None:
        self._x = 0
        self._y = 0
        self._moviments = 0
        self._direction = "S"
        self._history = defaultdict(int)
        self._maze = maze

    @property
    def current(self):
        return (self._x, self._y, self._direction)

    @property
    def moviments(self):
        return self._moviments

    @property
    def history(self):
        return self._history

    def reset(self):
        self._x = 0
        self._y = 0
        self._moviments = 0
        self._direction = "S"
        self._history.clear()

    def turn_left(self):
        new_directions = {'N': 'W', 'S': 'E', 'E': 'N', 'W': 'S'}
        self._direction = new_directions[self._direction]
        self._moviments += 1

    def turn_right(self):
        new_directions = {'N': 'E', 'S': 'W', 'E': 'S', 'W': 'N'}
        self._direction = new_directions[self._direction]
        self._moviments += 1

    def walk(self):
        cell = self._maze.cell_at(self._x, self._y)
        self._moviments += 1
        if (cell.walls[self._direction]):
            return False

        self._history[self.current] += 1

        directions = {"S": (0, 1), "N": (0, -1), "E": (1, 0), "W": (-1, 0)}
        self._x += directions[self._direction][0]
        self._y += directions[self._direction][1]
        return True


class Cell:
    """A cell in the maze.

    A maze "Cell" is a point in the grid which may be surrounded by walls to
    the north, east, south or west.

    """

    # A wall separates a pair of cells in the N-S or W-E directions.
    wall_pairs = {'N': 'S', 'S': 'N', 'E': 'W', 'W': 'E'}

    def __init__(self, x, y):
        """Initialize the cell at (x,y). At first it is surrounded by walls."""

        self.x, self.y = x, y
        self.walls = {'N': True, 'S': True, 'E': True, 'W': True}

    def has_all_walls(self):
        """Does this cell still have all its walls?"""

        return all(self.walls.values())

    def knock_down_wall(self, other, wall):
        """Knock down the wall between cells self and other."""

        self.walls[wall] = False
        other.walls[Cell.wall_pairs[wall]] = False


class Maze:
    def __init__(self, max_x, max_y, ix=0, iy=0):

        self.max_x, self.max_y = max_x, max_y
        self.ix, self.iy = ix, iy
        self.maze_map = [[Cell(x, y) for y in range(max_y)] for x in range(max_x)]

        self.end = (self.max_x - 1, self.max_y - 1)
        self.subject = Subject(self)

    def set_end(self, x, y):
        self.end = (x, y)

    def cell_at(self, x, y):
        return self.maze_map[x][y]

    def __str__(self):

        maze_rows = '-' * self.max_x * 2
        for y in range(self.max_y):

            maze_row = '|'
            for x in range(self.max_x):
                maze_row += ' |' if self.maze_map[x][y].walls['E'] else '  '

            maze_rows += f"\n{maze_row}"

            maze_row = '|'
            for x in range(self.max_x):
                maze_row += '-+' if self.maze_map[x][y].walls['S'] else ' +'

            maze_rows += f"\n{maze_row}"

        return '\n'.join(maze_rows)

    def find_valid_neighbours(self, cell):

        delta = [('W', (-1, 0)), ('E', (1, 0)), ('S', (0, 1)), ('N', (0, -1))]
        neighbours = []

        for direction, (dx, dy) in delta:
            x2, y2 = cell.x + dx, cell.y + dy

            if (0 <= x2 < self.max_x) and (0 <= y2 < self.max_y):
                neighbour = self.cell_at(x2, y2)

                if neighbour.has_all_walls():
                    neighbours.append((direction, neighbour))

        return neighbours

    def make_maze(self):
        # Total number of cells.
        n = self.max_x * self.max_y
        cell_stack = []
        current_cell = self.cell_at(self.ix, self.iy)
        # Total number of visited cells during maze construction.
        nv = 1

        while nv < n:
            neighbours = self.find_valid_neighbours(current_cell)

            if not neighbours:
                # We've reached a dead end: backtrack.
                current_cell = cell_stack.pop()
                continue

            # Choose a random neighbouring cell and move to it.
            direction, next_cell = random.choice(neighbours)
            current_cell.knock_down_wall(next_cell, direction)

            cell_stack.append(current_cell)

            current_cell = next_cell
            nv += 1
