class Queue:
    empty = []

    def __init__(self) -> None:
        self.queue = []
    
    def enqueue(self, i):
        self.queue.append(i)
        return self

    def dequeue(self):
        if self.queue == self.empty:
            return self
        else:
            self.queue = self.queue[1:]
            return self

if __name__ == "__main__":
    q = Queue()
    print(q.enqueue(1).enqueue(2).dequeue().enqueue(3).enqueue(4).dequeue().queue)

    q2 = Queue()
    print(q2.enqueue(1).dequeue().dequeue().dequeue().queue)