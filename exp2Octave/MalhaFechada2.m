close all;
x10 = [pi/36;0;0;0;0]

ref_v = 5; %Referencia de velocidade

% Ganhos para o PID da malha interna
kP_t=10000;
kI_t=100;
kD_t=100;

%Ganhos para o PID da malha externa

kP_v = 1000;
kI_v = 10;
kD_v = 1;


[tVec1,x1Vec] = ode45 (@(t,x) pid2(F, M, m, l, g, d, b, x, ref_v, kP_t, kI_t, kD_t, kP_v, kI_v, kD_v), [0 tEnd], x10);

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
%figure;
%plot(tVec1, (-kP*x1Vec(:,1) -kD*x1Vec(:,2) + x1Vec(:,4)));
%grid on;
%xlabel('time [s]','interpreter','latex')
%ylabel('U')