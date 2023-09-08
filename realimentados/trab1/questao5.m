%%%%%%% Variáveis %%%%%%%
close all;
K = 1/3; %constante de conversão eletromec. []
R = 10; %resistência do circuito [ohms]
B = 0.1; %Coeficiente de atrito [adimensional]
L = 0.5; %Indutancia [Henry]
J = 1; % Inercia da maquina
i0 = 0;

amostras = 500;

%%%%%%%%%% Vetores %%%%%%%%%%%%%%%%

V = zeros(amostras);
w = zeros(amostras);
i = zeros(amostras);
Tc = zeros(amostras);

Delta_V = zeros(amostras);
Delta_w = zeros(amostras);
Delta_i = zeros(amostras);
Delta_Tc = zeros(amostras);

t = zeros(amostras);


T = 0.05;
t(1) = T;


V(1) = 2;
w(1) = 0;
i(1) = 0;
Tc(1) = 0.25;

Delta_V(1) = 2;
Delta_w(1) = 0;
Delta_i(1) = 0;
Delta_Tc(1) = 0.25;


%%%%%%%% LOOP %%%%%%%

for k=2:amostras

    i(k) = i(k-1)*(1-(R*T)/L) + (T*(V(k-1)-K*w(k-1)))/L;

    if i(k)>=0
        Tm = 5.26*(1-exp(-i(k-1)));
    else
        Tm = -5.26*(1-exp(i(k-1)));
    end    

    w(k) = w(k-1)*(1-(B*T)/(J)) + (T*(Tm- Tc(k-1)))/(J);

    Delta_i(k) = Delta_i(k-1)*(1-(R*T)/L) + (T*(Delta_V(k-1)-K*Delta_w(k-1)))/L;

    Delta_w(k) = (T*(5.26*exp(-abs(i0))*Delta_i(k-1) -Delta_Tc(k-1) - B*Delta_w(k-1) + Delta_w(k-1) ))/J;

    Tc(k) = Tc(k-1);
    Delta_Tc(k) = Delta_Tc(k-1);
    V(k) = V(k-1);
    Delta_V(k) = Delta_V(k-1);
    t(k) = k*T;
end



plot(t,i)
hold on
plot(t,w)
plot(t,Delta_i)
plot(t,Delta_w)