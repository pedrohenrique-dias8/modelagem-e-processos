clc; 
clear all;
close all;
setup;

lambida = 0.35;
 
 
 

 
 
 q = 1.602*(10^(-19)); %[C]
 k = 1.38 *(10^(-23));
 Tr = 300; %[K] [Temperatura de referência da célula]
 Tp = 273; %[K] [Temperatura do painel photovoltaico]
 Iscr =1.9 ; %[A] [Corrente de curto circuito]
 Ior = ;%[A] [Corrente de saturação do painel, que depende de Tr]
 K = 0.0017; %[A/ºC] [Coeficiente de temperatura de curto circuito]
 C = 200; %[W/m^2] [Irradiação solar]
 Ego = 1.1; %[eV] [Band gap voltage]
 A = 1.92; %[Fator de qualidade do Diodo]
 Rs = ; %[Ohm] [Resistência em série da célula]
 Rsh = ;%[Ohm] [Resistência Shunt da célula]
 
 
 %%
 var = 0.5;
 V = 0;
 while var > 0.05
     Iantigo = Inovo;
     Ios = Ior((Tp/Tr)^3) * exp( (q*Ego/A*k) * ((1/Tr) - (1/Tp)));
     Ilg = (Iscr + K*(Tp - 25))* C/100;
     Inovo = Ilg - Ios*(exp(  (q /(n*k*Tp)) * (V + Iantigo*Rs) ) -1  ) - (V + Iantigo*Rs)/Rsh;
     Inovo = lambida*Inovo + (1 - lambida)*Iantigo;
     var = Inovo - Iantigo;
 end