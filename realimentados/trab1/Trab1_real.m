%%%%%%% Variáveis %%%%%%%
close all;
K = 1/3; %constante de conversão eletromec. []
R = 10; %resistência do circuito [ohms]
B = 0.1; %Coeficiente de atrito [adimensional]
L = 0.5; %Indutancia [Henry]
J = 1; % Inercia da maquina


i0 = 0;
%%%%%%%%%% Vetores %%%%%%%%%%%%%%%%

i = -3:0.1:3;
v1 = zeros(length(i));
v2 = zeros(length(i));
v3 = zeros(length(i));
v4 = zeros(length(i));
v5 = zeros(length(i));

w1 = zeros(length(i));
w2 = zeros(length(i));
w3 = zeros(length(i));
w4 = zeros(length(i));
w5 = zeros(length(i));

Tc1 = zeros(length(i));
Tc2 = zeros(length(i));
Tc3 = zeros(length(i));
Tc4 = zeros(length(i));
Tc5 = zeros(length(i));

wp1 = zeros(length(i));
wp2 = zeros(length(i));
wp3 = zeros(length(i));
wp4 = zeros(length(i));
wp5 = zeros(length(i));

%%%% Torque de Carga -2 %%%%%%%%%%
Tc = -2;

for n = 1:length(i)
  

    if i(n) < 0
      v1(n) = i(n)*R + (K*(-5.26*(1 - exp(i(n)))-Tc))/(B);
    else
      v1(n) = i(n)*R + (K*(5.26*(1 - exp(-i(n)))-Tc))/(B);
    end
  
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CORRENTE X TENSÂO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Torque de Carga -1 %%%%%%%%%%
Tc = -1;

for n = 1:length(i)
  

    if i(n) < 0
      v2(n) = i(n)*R + (K*(-5.26*(1 - exp(i(n)))-Tc))/(B);
    else
      v2(n) = i(n)*R + (K*(5.26*(1 - exp(-i(n)))-Tc))/(B);
    end
  
    
end

%%%% Torque de Carga 0 %%%%%%%%%%
Tc = 0;

for n = 1:length(i)
  

    if i(n) < 0
      v3(n) = i(n)*R + (K*(-5.26*(1 - exp(i(n)))-Tc))/(B);
    else
      v3(n) = i(n)*R + (K*(5.26*(1 - exp(-i(n)))-Tc))/(B);
    end
  
    
end

%%%% Torque de Carga 1 %%%%%%%%%%
Tc = 1;

for n = 1:length(i)
  

    if i(n) < 0
      v4(n) = i(n)*R + (K*(-5.26*(1 - exp(i(n)))-Tc))/(B);
    else
      v4(n) = i(n)*R + (K*(5.26*(1 - exp(-i(n)))-Tc))/(B);
    end
  
    
end

%%%% Torque de Carga 2 %%%%%%%%%%
Tc = 2;

for n = 1:length(i)
  

    if i(n) < 0
      v5(n) = i(n)*R + (K*(-5.26*(1 - exp(i(n)))-Tc))/(B);
    else
      v5(n) = i(n)*R + (K*(5.26*(1 - exp(-i(n)))-Tc))/(B);
    end
  
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VELOCIDADE X TENSÂO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%% Torque de Carga -2%%%%%

for n = 1:length(i)
  w1(n) = (v1(n) - R*i(n))/K;
end
%%%%%%% Torque de Carga -1%%%%%

for n = 1:length(i)
  w2(n) = (v2(n) - R*i(n))/K;
end
%%%%%%% Torque de Carga 0%%%%%

for n = 1:length(i)
  w3(n) = (v3(n) - R*i(n))/K;
end
%%%%%%% Torque de Carga 1%%%%%

for n = 1:length(i)
  w4(n) = (v4(n) - R*i(n))/K;
end
%%%%%%% Torque de Carga 2%%%%%

for n = 1:length(i)
  w5(n) = (v5(n) - R*i(n))/K;
end

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CORRENTE X TORQUE DE CARGA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% -40 V %%%%%%%%%%%%

  V = -40;
  
  for n = 1:length(i)
   
   if i(n)<0
     Tc1(n) = 5.26*(1-exp(-i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
     
   else
     Tc1(n) = -5.26*(1-exp(i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
   end
   
  end

%%%%%%%%%% -20 V %%%%%%%%%%%%

 V = -20;
  
  for n = 1:length(i)
   
   if i(n)<0
     Tc2(n) = 5.26*(1-exp(-i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
     
   else 
     Tc2(n) = -5.26*(1-exp(i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
   end
   
  end


%%%%%%%%%%   0 V %%%%%%%%%%%%
 V = 0;
  
  for n = 1:length(i)
   
   if i(n)<0
     Tc3(n) = 5.26*(1-exp(-i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
     
   else 
     Tc3(n) = -5.26*(1-exp(i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
   end
   
  end

%%%%%%%%%%  20 V %%%%%%%%%%%%
 V = 20;
  
  for n = 1:length(i)
   
   if i(n)<0
     Tc4(n) = 5.26*(1-exp(-i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
     
   else 
     Tc4(n) = -5.26*(1-exp(i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
   end
   
  end

%%%%%%%%%%  40 V %%%%%%%%%%%%
   V = 40;
  
  for n = 1:length(i)
   
   if i(n)<0
     Tc5(n) = 5.26*(1-exp(-i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
     
   else
     Tc5(n) = -5.26*(1-exp(i(n))) -(V*B)/(K) + (i(n)*R*B)/(K);
   end
   
  end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% VELOCIDADE X TORQUE DE CARGA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% -40 V %%%%%%%%%%%%
  
  for n = 1:length(i)
   
   if i(n)>=0
     wp1(n) = (5.26*(1-exp(-i(n))) -Tc1(n))/(B);
     
   else 
     wp1(n) = (-5.26*(1-exp(i(n))) - Tc1(n))/(B);
   end
   
  end
%%%%%%%%%% -20 V %%%%%%%%%%%%
  for n = 1:length(i)
   
   if i(n)>=0
     wp2(n) = (5.26*(1-exp(-i(n))) -Tc2(n))/(B);
     
   else 
     wp2(n) = (-5.26*(1-exp(i(n))) - Tc2(n))/(B);
   end
   
  end
%%%%%%%%%%   0 V %%%%%%%%%%%%
  for n = 1:length(i)
   
   if i(n)>=0
     wp3(n) = (5.26*(1-exp(-i(n))) -Tc3(n))/(B);
     
   else 
     wp3(n) = (-5.26*(1-exp(i(n))) - Tc3(n))/(B);
   end
   
  end
%%%%%%%%%%  20 V %%%%%%%%%%%%
    for n = 1:length(i)
   
   if i(n)>=0
     wp4(n) = (5.26*(1-exp(-i(n))) -Tc4(n))/(B);
     
   else 
     wp4(n) = (-5.26*(1-exp(i(n))) - Tc4(n))/(B);
   end
   
    end
%%%%%%%%%%  40 V %%%%%%%%%%%%
    for n = 1:length(i)
   
   if i(n)>=0
     wp5(n) = (5.26*(1-exp(-i(n))) -Tc5(n))/(B);
     
   else 
     wp5(n) = (-5.26*(1-exp(i(n))) - Tc5(n))/(B);
   end
   
    end
%%%%%%%plot de gráfico
figure
plot(v1,i)
xlim([-40 40])
hold on;
plot(v2,i)
plot(v3,i)
plot(v4,i)
plot(v5,i)

figure
plot(v1, w1)
xlim([-40 40])
ylim([-30 30])
hold on;
plot(v2, w2)
plot(v3, w3)
plot(v4, w4)
plot(v5, w5)

figure
plot(Tc1,i)
xlim([-2 2])
hold on;
plot(Tc2,i)
plot(Tc3,i)
plot(Tc4,i)
plot(Tc5,i)

figure
plot(Tc1, wp1)
xlim([-2 2])
ylim([-30 30])
hold on
plot(Tc2, wp2)
plot(Tc3, wp3)
plot(Tc4, wp4)
plot(Tc5, wp5)