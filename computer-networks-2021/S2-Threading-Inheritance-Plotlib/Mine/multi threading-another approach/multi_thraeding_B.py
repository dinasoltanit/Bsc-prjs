import threading
# from threading import Thread
import math
import matplotlib.pyplot as plt
import numpy as np
from time import sleep
from queue import Queue


class myThread (threading.Thread):

    def __init__(self, t_ID):
        threading.Thread.__init__(self)
        #self.t_target = t_target
        self.t_ID = t_ID

    # write want you want to do in run
    def run(self):
        qInput = q.get()
        if self.t_ID == 1:
            f1[qInput[0]] = math.cos(qInput[1])
            q.task_done()
            sleep(2)
            return True
        elif self.t_ID == 2:
            f2[qInput[0]] = math.sin(qInput[1])
            q.task_done()
            sleep(2)
            return True

        # self._target(qInput)
        # sleep(1)


q = Queue()
t_array = np.arange(0, 50, 0.01)

for i in range(len(t_array)):
    q.put((i, t_array[i]))

f1 = [{}for t in t_array]
f2 = [{}for t in t_array]

threads1 = []
threads2 = []
num_threads = len(t_array)
sig = []


# def func1(q, f1):
#     time1 = q.get()
#     f1[time1[0]] = math.cos(time1[1])
#     # sleep(2)
#     q.task_done()
#     return True
# ======================================================================
# def func2(q, f2):
#     time2 = q.get()
#     f2[time2[0]] = math.sin(time2[1])
#     # sleep(2)
#     q.task_done()
#     return True

# Create new threads
def main():
    for ii in range(num_threads):
        thread1 = myThread(1)
        thread1.start()
        threads1.append(thread1)
    for jj in range(num_threads):
        thread2 = myThread(2)
        thread2.start()
        threads2.append(thread2)
    # Start new Threads
    for thread1 in threads1:
        thread1.join()

    for thread2 in threads2:
        thread2.join()

    sig = threads1 + threads2
    plt.plot(t_array, sig, 'g^')
    plt.show()
    plt.xlabel('time (s)')
    plt.ylabel('signal')
    plt.grid(True)
    plt.savefig("sig.png")
    plt.show()
    print("finished")


main()
