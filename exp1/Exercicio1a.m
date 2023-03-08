 G = Gn; 
 
 V = (0:0.01:1);
 
 I = zeros(100);
 Ipv = zeros(100);
 Id = zeros(100);
 Ip = zeros(100);
 T = 0;
 for i = 1:1:100
     Ipv(i) = (G/Gn)*(Iscn + K1*(T-Tn));
     Id(i) = Is*(exp((V(i) + Rs*I(i))/Vt*A) - 1);
     Ip(i) = ((V + Rs*I(i))/Rp);
     I(i) = Ipv(i) - Id(i) - Ip(i);
 end