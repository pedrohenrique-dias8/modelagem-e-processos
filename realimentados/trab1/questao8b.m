close all
clear all

Gv = tf([0.2567], [1 -0.8607], 0.64695)

C = tf([1.7576 -0.8607*1.7576], [1 -1], 0.64695)

gmf = C*Gv/(1+C*Gv)

step(gmf)
hold on
step(Gv)