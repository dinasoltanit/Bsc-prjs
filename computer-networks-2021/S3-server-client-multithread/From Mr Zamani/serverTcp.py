from socket import *


srvAdr, srvPort = ('localhost', 1235)
srvSocket = socket(AF_INET, SOCK_STREAM)
srvSocket.bind((srvAdr, srvPort))
srvSocket.listen(1)
print("TCP server is running ...")
while True:
    connnection, adr = srvSocket.accept()
    print(connnection)
    print(adr)
    msg = connnection.recv(2048).decode()
    print(msg)
    connnection.send(bytes(msg.upper(), 'UTF-8'))
    connnection.close()
    if msg == 'exit':
        break
srvSocket.close()