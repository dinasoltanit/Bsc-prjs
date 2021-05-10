from socket import *

portAdr = 1234
srvAdr = 'localhost'

clientSocket = socket(AF_INET, SOCK_DGRAM)

msg = input("input your message to send:")
clientSocket.sendto(bytes(msg, 'UTF-8'), (srvAdr, portAdr))
newMsg = clientSocket.recv(2048)
print(newMsg.decode())
clientSocket.close()
