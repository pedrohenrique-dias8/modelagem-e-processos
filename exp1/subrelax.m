function [ Inov ] = subrelax( tol, lambida, G, T, Vat, Init )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    setup;
    Vt = k*T/q;
    
    Inov = Init;
    var = tol*2;
    
  while abs(var) > tol
          Iant = Inov;
          Ipv = (G/Gn)*(Iscn + K1*(T-Tn));
          Id = Is*(exp((Vat + Rs*Iant)/(Vt*A)) - 1);
          Ip = ((Vat + Rs*Iant)/Rp);
          Inov = Ipv - Id - Ip;
          Inov = lambida*Inov + (1 - lambida)*Iant;
          var = Inov - Iant;
   end

end

