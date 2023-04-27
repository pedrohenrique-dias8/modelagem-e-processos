close all;
x10 = [0;0;0]
[tVec1,x1Vec] = ode45 (@(t,x) func2(F,M, m, l, g, d, b, x), [0 tEnd], x10);

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