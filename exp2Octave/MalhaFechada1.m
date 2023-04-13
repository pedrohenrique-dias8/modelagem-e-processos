x10 = [pi/4;0;0;0]

ref = 0;

kP=100000;
kI=100000;
kD=100;


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