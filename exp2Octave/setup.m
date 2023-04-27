%%https://www.scooterzmalaysia.com/products/ninebot-segway-minipro-2-wheel-self-balancing-scooter-hoverboard
close all;
clc;
clear all;

P = 800; %%Potencia do motor [W]
Vmax = 18.8/3.6; %Velocidade maxima do segway [m/s]

tEnd = 10; %%[s]

g = 9.8; %%Aceleração da gravidade [m/s^2]
m = 60; %% massa na ponta do pendulo [Kg]
M = 44; %% massa na base do pendulo [Kg]
l = 1.5; %% haste do pêndulo [m]
d = P/(Vmax*Vmax); %%coeficiente de atrito cinético
b = 10; %%coeficiente de atrito viscoso
F = 0; %%Força aplicada na base [N]

