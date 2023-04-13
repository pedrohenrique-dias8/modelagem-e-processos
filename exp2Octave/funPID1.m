function dxdt = funPID1(F, M, m, l, g, d, b, x, ref, kP, kI, kD)
teta = x(1);
tetap = x(2);
Vb = x(3);
uI = x(4);

e = ref - teta;
uP = kP*e;
uD = -kD*tetap
u = uP + uI + uD;
F = u;


dx1dt = tetap;
dx2dt = ( (M + m)*l*g*sin(teta) - ((M+m)/m)*b*tetap + l*cos(teta)*( F - d*Vb - m*l*sin(teta)*(tetap^2) )   )/( (l^2)*(M + m*((sin(teta))^2)) );
dx3dt = ( F - d*Vb - m*l*sin(teta)*(tetap^2) + cos(teta)*sin(teta)*m*g - (cos(teta)/l)*b*tetap)/( M + m*(((sin(teta))^2)) );
dx4dt = kI*e
dxdt = [dx1dt, dx2dt, dx3dt, dx4dt]
end