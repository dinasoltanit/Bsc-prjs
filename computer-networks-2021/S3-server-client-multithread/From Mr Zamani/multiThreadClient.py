import socket

host = '127.0.0.1'
port = 12345
s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect((host,port))

while True:
    msg = input("connected to TCP server, please input your message:")
    s.send(bytes(msg, 'UTF-8'))

    data = s.recv(1024)
    print('Received from the server :',str(data.decode()))

    ans = input('\nDo you want to continue(y/n) :')
    if ans == 'y':
        continue
    else:
        break

s.close()

