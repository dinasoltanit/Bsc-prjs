from threading import Thread, current_thread
from time import sleep # importing time step
from queue import Queue # first in first out but stack: 1st in last out

def worker():
    while True:
        qInput = q.get()
        print(current_thread(), 'input =', qInput)
        sleep(3)
        q.task_done()


q = Queue()

for i in range(5):
    t = Thread(target=worker)
    t.daemon = True # ta method start ro call nakonim soru nemikone
    t.start()

for item in range(10):
    q.put(item)

q.join() # main-thread montazer mimune ta kari ke in saf bayad anjam bede tamam beshe
print("finished")

# threading: rabti be multi-processing nadare. bahse tanzim carhast. if we have
# single-threading, then only one program at each time. if multi-threading, then
# I can have my Skype open, recording the screen while still working on my chrome browser
