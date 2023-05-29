clear all
close all
clc

%% Extração dos dados experimentais

CtoK = 273.15; %[K] 0°C (conversão para Kelvin)

tau = 5; %[s] período de amostragem

data = xlsread('dados_20_2400.xlsx');
%load('dados_20_2100.mat')

vecTa = data(:,3) + CtoK; %[K] temperatura ambiente
vecTi = data(:,4) + CtoK; %[K] temperatura do gabinete (interna)
vecTe = data(:,5) + CtoK; %[K] temperatura do evaporador
vecTc = data(:,6) + CtoK; %[K] temperatura do condensador
vecTime = 0:tau:(length(vecTa)-1)*tau; %[s] tempo decorrido
vecFreq = data(:,54)/60; %[Hz] velocidade/frequência do compressor
vecS = zeros(size(vecFreq)); %[-] compressor em funcionamento (bool)
N = length(vecS); % número de amostras
for i=1:N
    if vecFreq(i) > 0
        vecS(i) = 1;
    end
end

%% Gráficos dos dados experimentais

figure
set(gcf,'name','Compressor')
plot(vecTime/3600,vecFreq*60)
grid on
hold on
plot(vecTime/3600,vecS*1e3,'-.')
xlabel('tempo [h]')
%ylabel('velocidade [RPM]','interpreter','latex')
lh = legend('velocidade [RPM]','estado*1000');
set(lh,'location','best')

figure
set(gcf,'name','Temperaturas')
plot(vecTime/3600,vecTa-CtoK)
grid on
hold on
plot(vecTime/3600,vecTi-CtoK)
plot(vecTime/3600,vecTe-CtoK)
plot(vecTime/3600,vecTc-CtoK)
xlabel('tempo [h]')
ylabel('temperatura [°C]')
lh = legend('amb.','int.','evap.','cond.');
set(lh,'location','best')
return
%% Identificação por MQ do modelo caixa-preta

nOut = 3; %número de saídas

%...

%saídas estimadas
vecTi_e = zeros(size(vecTi));
vecTe_e = zeros(size(vecTe));
vecTc_e = zeros(size(vecTc));

%Simulação no tempo discreto
%condições iniciais
vecTi_e(1) = vecTi(1);
vecTe_e(1) = vecTe(1);
vecTc_e(1) = vecTc(1);

%...

%% RESULTADOS

%% Gráficos dos dados experimentais
    
    figure
    set(gcf,'OuterPosition',[figWidth figHeight figWidth figHeight]);
    set(gcf,'name','Temperaturas')
    plot(vecTime/3600,vecTa-CtoK)
    grid on
    hold on
    plot(vecTime/3600,vecTi-CtoK)
    plot(vecTime/3600,vecTe-CtoK)
    plot(vecTime/3600,vecTc-CtoK)
    xlabel('tempo [h]','interpreter','latex')
    ylabel('temperatura [$^\circ$C]','interpreter','latex')
    lh = legend('amb.','int.','evap.','cond.');
    set(lh,'interpreter','latex','location','best')

return

%% Identificação do modelo fenomenológico por minimização do erro quadrático

x0 = 1e1*ones(9,1);
lb = zeros(9,1); % limite inferior dos parâmetros
options = optimoptions(@fmincon,'MaxFunctionEvaluations',1e6);

x = fmincon(@(x) funMin(x,"demais argumentos da funcao"),x0,[],[],[],[],lb,[],[],options);

Rai = x(1);
Rei = x(2);
Rec = x(3);
Rcp = x(4);
Ci = x(5);
Ce = x(6);
Cc = x(7);
gamma = x(8);
Rca = x(9);
% 
% Simulação no tempo discreto
% saídas estimadas
vecTi_em = zeros(size(vecTi));
vecTe_em = zeros(size(vecTe));
vecTc_em = zeros(size(vecTc));

% condições iniciais
vecTi_em(1) = vecTi(1);
vecTe_em(1) = vecTe(1);
vecTc_em(1) = vecTc(1);

%...

% % Gráficos de resultados
if fig == 1
    figure
    %...
end