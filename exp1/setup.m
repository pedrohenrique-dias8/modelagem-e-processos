%SETUP
clc
sampletime = 0.02;

%Buck
R = 1; %resist�ncia de carga[ohm]
L = 1/1000; %indut�ncia[H]
C = 800/(10^6); %capacit�ncia[F]
Vi = 1; %tens�o de entrada[V]
Fs = 2000; %frenqu�ncia de chaveamento do sinal PWM[Hz]
D = 0.3;

%C�lula fotovoltaica
Rp = 38.17; %resist�ncia shunt[ohm]
Rs = 61.3/1000; %resist�ncia s�rie[ohm]
A = 1.7538; %fator de idealidade do diodo
Is = 5.68/(10^6); %corrente de satura��o do diodo [A]
Iscn = 3.1656; %corrente de curto-circuito nominal [A]
Gn = 1000; %irradia��o solar nominal [W/m^2]
Tn = 25+273; %temperatura nominal da c�lula fotovoltaica [�C]
K1 = (1.8/1000)/273; %coeficiente de temperatura da corrente de curto-circuito [A/�C]
q = 1.602*(10^(-19)); %[C]
k = 1.38 *(10^(-23));