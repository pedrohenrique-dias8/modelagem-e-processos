vec0 = zeros(30)

[tVec1,x1Vec] = ode45 (@(t,x) func(h, H, F, D, B, L, QB, vec), [0 tEnd], vec0);

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
