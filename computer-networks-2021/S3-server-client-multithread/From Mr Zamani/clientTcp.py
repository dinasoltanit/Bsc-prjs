from socket import *

srvAdr = 'localhost'
srvPort = 1235
clientSocket = socket(AF_INET, SOCK_STREAM)
clientSocket.connect((srvAdr, srvPort))
msg = input("connected to TCP server, please input your message:")
clientSocket.send(bytes(msg, 'UTF-8'))
newMsg = clientSocket.recv(2048)
print("new message: {}".format(newMsg))
clientSocket.close()
