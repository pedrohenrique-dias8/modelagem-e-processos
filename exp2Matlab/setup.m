%%https://www.scooterzmalaysia.com/products/ninebot-segway-minipro-2-wheel-self-balancing-scooter-hoverboard
clear all;
SampleTime = 50; %%[s]

g = 9.8; %%Aceleração da gravidade [m/s^2]
m = 3; %% massa na ponta do pendulo [Kg]
M = 44; %% massa na base do pendulo [Kg]
l = 1.5; %% haste do pêndulo [m]
d = 0.5; %%coeficiente de atrito cinético
b = 0.9; %%coeficiente de atrito viscoso