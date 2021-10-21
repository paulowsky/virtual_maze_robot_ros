import asyncio
import itertools
import threading

from uuid import uuid4


class Controller:
    """Classe que controla a distribuição de tarefas em diferentes Threads"""

    threads = []
    loops_cycle = None
    loops = []
    tasks = []

    @staticmethod
    def _new_loop(loop):
        asyncio.set_event_loop(loop)
        loop.run_forever()

    @classmethod
    def cancel(cls):

        for task in cls.tasks:
            task.cancel()

    @classmethod
    def init(cls, count=1):
        """Função inicializadora das Threads
        Parameters
        ----------
            count (int):
                Número de Threads.
        """
        if (len(cls.threads) != 0):
            return

        for _ in range(count):
            loop = asyncio.new_event_loop()

            thread = threading.Thread(target=cls._new_loop, args=(loop, ))
            thread.start()

            cls.threads.append(thread)
            cls.loops.append((str(uuid4()), loop))

        cls.loops_cycle = itertools.cycle(cls.loops)

    @classmethod
    def _get_loop(cls) -> asyncio.BaseEventLoop:
        _, loop = next(cls.loops_cycle)
        return loop

    @classmethod
    def start(cls, task, *args, **kwargs) -> str:
        loop = cls._get_loop()
        kwargs["loop"] = loop
        task = asyncio.run_coroutine_threadsafe(task(*args, **kwargs), loop=loop)
        cls.tasks.append(task)
        return task
