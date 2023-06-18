from socket import *

server_name = input("\nType in server name: ")
port = int(input("Type in server port"))

IP_adress = gethostbyname(server_name)
s = socket(AF_INET, SOCK_STREAM)
s.connect((IP_adress, port))

while True:
    
    sentence = input("\nType in message (Fin to finish): ")

    if sentence.upper() == "FIN":
        sentence = sentence.upper()
        s.send(sentence.encode())
        s.close
        break

    s.send(sentence.encode())

    message = s.recv(1024)
    print("I have received the sum:", message)
    s.close



