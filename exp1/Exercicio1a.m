 G = Gn; 
 
 V = (0:0.01:1);
 
 I = zeros(1,100);
 Ipv = zeros(1,100);
 Id = zeros(1,100);
 Ip = zeros(1,100);
 T = 60;
 
 q = 1.602*(10^(-19)); %[C]
 k = 1.38 *(10^(-23));
 
 Vt = k*T/q;
 I(1) = 1;
 
 var = 0.5;
 lambida = 0.6;

 
 while var > 0.05
     i = 2;
     Ipv(i) = (G/Gn)*(Iscn + K1*(T-Tn));
     Id(i) = Is*(exp((V(i) + Rs*I(i-1))/Vt*A) - 1);
     Ip(i) = ((V(i) + Rs*I(i-1))/Rp);
     I(i) = Ipv(i) - Id(i) - Ip(i);
     
     I(i) = lambida*I(i) + (1 - lambida)*I(i - 1);
     var = (I(i) - I(i - 1))*(10^-6);
     i = i + 1;
 end