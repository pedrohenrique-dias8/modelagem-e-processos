from socket import *

udp = socket(AF_INET, SOCK_DGRAM)

while True:
    message = input("\nType in message: ")

    udp.sendto( message.encode(), ("127.0.0.1", 5000))

    if message == '':
        break

udp.close()