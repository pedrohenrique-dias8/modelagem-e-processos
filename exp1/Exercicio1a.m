clc;
clear all;
close all;
setup;

G = Gn; 
lambida = 0.35;
 
 V = (0:0.01:1);
 
 I0 = zeros(size(V));
 I25 = zeros(size(V));
 I60 = zeros(size(V));
 %Ipv = zeros(1,100);
 %Id = zeros(1,100);
 %Ip = zeros(1,100);
 
 
 q = 1.602*(10^(-19)); %[C]
 k = 1.38 *(10^(-23));
 
 
 
 %%
 
  T = 0+273;
  Vt = k*T/q;
 for i = 1:101
     Inov = 1;
     var = 0.5; 
     Vat = V(i);
     
      while var > 0.05
          Iant = Inov;
          Ipv = (G/Gn)*(Iscn + K1*(T-Tn));
          Id = Is*(exp((Vat + Rs*Iant)/(Vt*A)) - 1);
          Ip = ((Vat + Rs*Iant)/Rp);
          Inov = Ipv - Id - Ip;
          Inov = lambida*Inov + (1 - lambida)*Iant;
          var = Inov - Iant;
      end
        if Inov < 0 
           Inov = 0;
        end
      I0(i) = Inov;
 end
%%

 T = 25+273;
 Vt = k*T/q;
 for i = 1:101
     Inov = 1;
     var = 0.5; 
     Vat = V(i);
     
      while var > 0.0005
          Iant = Inov;
          Ipv = (G/Gn)*(Iscn + K1*(T-Tn));
          Id = Is*(exp((Vat + Rs*Iant)/(Vt*A)) - 1);
          Ip = ((Vat + Rs*Iant)/Rp);
          Inov = Ipv - Id - Ip;
          Inov = lambida*Inov + (1 - lambida)*Iant;
          var = Inov - Iant;
      end
       if Inov < 0 
           Inov = 0;
       end
     I25(i) = Inov;
 end

%%
T = 60+273;
Vt = k*T/q;

for i = 1:101
    Inov = 1;
    var = 0.5; 
    Vat = V(i);
    
     while var > 0.0005
         Iant = Inov;
         Ipv = (G/Gn)*(Iscn + K1*(T-Tn));
         Id = Is*(exp((Vat + Rs*Iant)/(Vt*A)) - 1);
         Ip = ((Vat + Rs*Iant)/Rp);
         Inov = Ipv - Id - Ip;
         Inov = lambida*Inov + (1 - lambida)*Iant;
         var = Inov - Iant;
     end
       if Inov < 0 
           Inov = 0;
       end
     I60(i) = Inov;
end 
%%
figure;
plot(V,I60,'b', V, I0, 'g', V, I25, 'r');
xlabel('V');
ylabel('I');


pot0 = zeros(size(V));
pot25 = zeros(size(V));
pot60 = zeros(size(V));
for i = 1:101
    pot0(i)= V(i)*I0(i);
    pot25(i)= V(i)*I25(i);
    pot60(i)= V(i)*I60(i);
end

figure;
plot(V,pot60,'b', V, pot0, 'g', V, pot25, 'r');
xlabel('V');
ylabel('potencia');




