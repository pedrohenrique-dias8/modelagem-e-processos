clc;
clear all;
setup;

T = Tn; 
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
 
  G = 200;
  Vt = k*T/q;
 for i = 1:1:101
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
      if Inov<0
         Inov = 0;
     end
      I200(i) = Inov;
 end
%%

 G = 500;
 Vt = k*T/q;
  lambida = 0.35;
 for i = 1:1:101
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
      if Inov<0
         Inov = 0;
     end
      I500(i) = Inov;
 end

%%
G = 1000;
Vt = k*T/q;
 lambida = 0.35;
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
     if Inov<0
         Inov = 0;
     end
     I1000(i) = Inov;
end 
%%
figure;
plot(V,I200,'b', V, I500, 'g', V, I1000, 'r');
xlabel('V');
ylabel('I');


pot200 = zeros(size(V));
pot500 = zeros(size(V));
pot1000 = zeros(size(V));
for i = 1:1:101
    pot200(i)= V(i)*I200(i);
    pot500(i)= V(i)*I500(i);
    pot1000(i)= V(i)*I1000(i);
end

figure;
plot(V,pot200,'b', V, pot500, 'g', V, pot1000, 'r');
xlabel('V');
ylabel('potencia');




