from socket import *


adr = '127.0.0.1'
port = 1234

srvSocket = socket(AF_INET, SOCK_DGRAM)
srvSocket.bind((adr, port))
print("UDP server is running ....")
message, adr = srvSocket.recvfrom(2048)
message = message.decode()
print(message)
print(adr)
srvSocket.sendto(bytes(message.upper(), 'UTF-8'), adr)
srvSocket.close()
