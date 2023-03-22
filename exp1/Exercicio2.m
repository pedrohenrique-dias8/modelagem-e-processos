clc;
clear all;
close all;
setup;

G = Gn; 
I1 = zeros(1,11);
I2 = zeros(size(I1));
counter = (1:11); 
q = 1.602*(10^(-19)); %[C]
k = 1.38 *(10^(-23));

    Inov = 1;
    I1(1) = 1;
    I2(1) = 1; 
    Vat = 0;
    T = 60+273;
    Vt = k*T/q;
 %%   
    var = 0.5;
    lambida = 0.5;
    i = 2;
     while var > 0.005
         Iant = Inov;
         Ipv = (G/Gn)*(Iscn + K1*(T-Tn));
         Id = Is*(exp((Vat + Rs*Iant)/(Vt*A)) - 1);
         Ip = ((Vat + Rs*Iant)/Rp);
         Inov = Ipv - Id - Ip;
         Inov = lambida*Inov + (1 - lambida)*Iant;
         var = Inov - Iant;
         I1(i) = Inov;
         i = i + 1;
     end
     
 for i1 = 1:11
     if I1(i1) <= 0
         i1 = i1 -1;
         break
     end
 end
 
 I1f = zeros(1,i1);
 for i = 1:i1
     I1f(i) = I1(i);
 end    
 
  
 counter1 = 1:i1;
 
     
 %%    
     var = 0.5;
     i = 2;
     Inov = 1;
     lambida = 0.8;
     while var > 0.005
         Iant = Inov;
         Ipv = (G/Gn)*(Iscn + K1*(T-Tn));
         Id = Is*(exp((Vat + Rs*Iant)/(Vt*A)) - 1);
         Ip = ((Vat + Rs*Iant)/Rp);
         Inov = Ipv - Id - Ip;
         Inov = lambida*Inov + (1 - lambida)*Iant;
         var = Inov - Iant;
         I2(i) = Inov;
         i = i + 1;
     end
  
  for i2 = 1:11
     if I2(i2) <= 0
         i2 = i2 -1;   
         break
     end
 end
 
 I2f = zeros(1,i2);
 for i = 1:i2
     I2f(i) = I2(i);
 end    
 
  
 counter2 = 1:i2;    
%%

figure;
plot(counter1, I1f, 'bo', counter2, I2f, 'go');
grid on;
legend({'lambda = 0.5','Lambda = 0.8'},'Location','southwest');
xlabel('Iterações');
ylabel('Corrente [A]')
title('V = 0')
