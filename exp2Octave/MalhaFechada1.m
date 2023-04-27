close all;
x10 = [pi/36;0;0;0]

ref = 0;

kP=10000;
kI=100;
kD=200;


[tVec1,x1Vec] = ode45 (@(t,x) funPID1(F, M, m, l, g, d, b, x, ref, kP, kI, kD), [0 tEnd], x10);

figure
plot(tVec1,x1Vec(:,1)*180/pi);
grid on;
xlabel('time [s]','interpreter','latex')
ylabel('\theta [deg]')
figure
plot(tVec1,x1Vec(:,3));
grid on;
xlabel('time [s]','interpreter','latex')
ylabel('Vb [m/s]')
figure;
plot(tVec1, (-kP*x1Vec(:,1) -kD*x1Vec(:,2) + x1Vec(:,4)));
grid on;
xlabel('time [s]','interpreter','latex')
ylabel('U')