function dxdt = func2(F, M, m, l, g, d, b, x)
teta = x(1);
tetap = x(2);
Vb = x(3);

u =1;
F = (  ((M+m*sin(teta))*l*l*(M+m)*(-b*tetap+u))/(m) -M*l*l*( (M+m)*l*g*sin(teta)-  ((M+m)*b*tetap)/(m) -l*cos(teta)*d*Vb - l*l*m*cos(teta)*sin(teta)*tetap*tetap )  )/(M*l*l*l*cos(teta));


dx1dt = tetap;
dx2dt = ( (M + m)*l*g*sin(teta) - ((M+m)/m)*b*tetap + l*cos(teta)*( F - d*Vb - m*l*sin(teta)*(tetap^2) )   )/( (l^2)*(M + m*((sin(teta))^2)) );
dx3dt = ( F - d*Vb - m*l*sin(teta)*(tetap^2) + cos(teta)*sin(teta)*m*g - (cos(teta)/l)*b*tetap)/( M + m*(((sin(teta))^2)) );

dxdt = [dx1dt, dx2dt, dx3dt]
end