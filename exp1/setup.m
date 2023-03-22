%SETUP
clc
sampletime = 0.02;

%Buck
R = 1; %resistência de carga[ohm]
L = 1/1000; %indutância[H]
C = 800/(10^6); %capacitância[F]
Vi = 1; %tensão de entrada[V]
Fs = 2000; %frenquência de chaveamento do sinal PWM[Hz]
D = 0.3;

%Célula fotovoltaica
Rp = 38.17; %resistência shunt[ohm]
Rs = 61.3/1000; %resistência série[ohm]
A = 1.7538; %fator de idealidade do diodo
Is = 5.68/(10^6); %corrente de saturação do diodo [A]
Iscn = 3.1656; %corrente de curto-circuito nominal [A]
Gn = 1000; %irradiação solar nominal [W/m^2]
Tn = 25+273; %temperatura nominal da célula fotovoltaica [ºC]
K1 = (1.8/1000)/273; %coeficiente de temperatura da corrente de curto-circuito [A/ºC]
q = 1.602*(10^(-19)); %[C]
k = 1.38 *(10^(-23));