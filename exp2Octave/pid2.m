function dxdt = pid2(F, M, m, l, g, d, b, x, ref_v, kP_t, kI_t, kD_t, kP_v, kI_v, kD_v)
teta = x(1);
tetap = x(2);
Vb = x(3);
uI_t = x(4);
uI_v = x(5);



%%Referente a Velocidade
ev = ref_v - Vb
uP_v = kP_v*ev;
uD_v = 0; %-kD_v*Vbp;
u_v = uP_v + uI_v + uD_v;
ref_t = u_v;


%Referente a theta 
et = ref_t - teta;
uP_t = kP_t*et;
Vbp = ( kP_t*et + uI_t + kD_t*kI_v*ev -kD_t*tetap - d*Vb - m*l*sin(teta)*(tetap^2) + cos(teta)*sin(teta)*m*g - (cos(teta)/l)*b*tetap)/( M + m*(((sin(teta))^2)) + kD_t*kP_v);
ref_tp = -kP_v*Vbp + kI_v*ev
uD_t = kD_t*(ref_tp - tetap); %%Discutir sobre derivada do erro
u_t = uP_t + uI_t + uD_t;

F = (  ((M+m*sin(teta))*l*l*(M+m)*(-b*tetap+u_t))/(m) -M*l*l*( (M+m)*l*g*sin(teta)-  ((M+m)*b*tetap)/(m) -l*cos(teta)*d*Vb - l*l*m*cos(teta)*sin(teta)*tetap*tetap )  )/(M*l*l*l*cos(teta));
%%

dx1dt = tetap;
dx2dt = ( (M + m)*l*g*sin(teta) - ((M+m)/m)*b*tetap + l*cos(teta)*( F - d*Vb - m*l*sin(teta)*(tetap^2) )   )/( (l^2)*(M + m*((sin(teta))^2)) );
dx3dt = ( F - d*Vb - m*l*sin(teta)*(tetap^2) + cos(teta)*sin(teta)*m*g - (cos(teta)/l)*b*tetap)/( M + m*(((sin(teta))^2)) );
dx4dt = kI_t*et;
dx5dt = kI_v*ev;
dxdt = [dx1dt, dx2dt, dx3dt, dx4dt, dx5dt];
end