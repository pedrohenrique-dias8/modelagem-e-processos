
######## TCP
from socket import *

port_tcp = 4000;
port_udp = 5000;

s = socket()
udp = socket(AF_INET, SOCK_DGRAM)
udp.bind(('127.0.0.1', port_udp))


s.bind((gethostbyname('localhost'), port_tcp))
s.listen(5)

while True:

    c, addr = s.accept()
    msg, client = udp.recvfrom(1024)

    print("TCP connection established:", addr)
    print("UDP connection established:", client)

    data = c.recv(1024)
    print("Message via TCP:",data)
    print("Message via UDP:",msg)

    aux = int(data) + int(msg)
    
    print("I will send the sum:", aux)
    
    aux = str(aux)

    c.send(aux.encode())

    c.close()
