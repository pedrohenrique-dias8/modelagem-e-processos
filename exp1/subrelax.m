function [ Inov ] = subrelax( var, lambida, G, T, Vat, Vt )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    setup;
    Inov = 1;
   
    
  while abs(var) > 0.005
          Iant = Inov;
          Ipv = (G/Gn)*(Iscn + K1*(T-Tn));
          Id = Is*(exp((Vat + Rs*Iant)/(Vt*A)) - 1);
          Ip = ((Vat + Rs*Iant)/Rp);
          Inov = Ipv - Id - Ip;
          Inov = lambida*Inov + (1 - lambida)*Iant;
          var = Inov - Iant;
   end

end

