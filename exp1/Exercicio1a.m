clc;
clear all;
close all;
setup;

G = Gn; 
lambida = 0.1;
 
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
     var = 0.5; 
     Vat = V(i);
     
      Inov = subrelax(var, lambida, G, T, Vat, Vt);     
       
      I0(i) = Inov;
      
 end
 
 
 for i0 = 1:101
     if I0(i0) < 0
         break
     end
 end
 
 I0f = zeros(1,i0);
 for i = 1:i0
     I0f(i) = I0(i);
 end    
 
  
 V0 = zeros(1,i0);
 for i = 2:i0
     V0(i)=V0(i-1) + 0.01;
 end
 
 %%

 T = 25+273;
 Vt = k*T/q;
 for i = 1:101
     var = 0.5; 
     Vat = V(i);
     
      Inov = subrelax(var, lambida, G, T, Vat, Vt);
      
     I25(i) = Inov;
 end

 for i25 = 1:101
     if I25(i25) < 0
         break
     end
 end
 
I25f = zeros(1,i25);
 for i = 1:i25
    I25f(i) = I25(i);
 end    
 
  
V25 = zeros(1,i25);
 for i = 2:i25
     V25(i)=V25(i-1) + 0.01;
 end
%%
T = 60+273;
Vt = k*T/q;

for i = 1:101
     var = 0.5; 
     Vat = V(i);
     
      Inov = subrelax(var, lambida, G, T, Vat, Vt);
     
     I60(i) = Inov;
end 

for i60 = 1:101
     if I60(i60) < 0
         break
     end
 end
 
 I60f = zeros(1,i60);
 for i = 1:i60
     I60f(i) = I60(i);
 end    
 
  
 V60 = zeros(1,i60);
 for i = 2:i60
     V60(i)=V60(i-1) + 0.01;
 end


%%
figure;
plot(V60,I60f,'b', V0, I0f, 'g', V25, I25f, 'r');
grid on;
xlabel('V');
ylabel('I');
legend({'60°C', '0°C', '25°C'}, 'Location', 'northeast' )


pot0 = zeros(size(V0));
pot25 = zeros(size(V25));
pot60 = zeros(size(V60));
for i = 1:i0
    pot0(i)= V0(i)*I0f(i);
end
for i =1:i25
    pot25(i)= V25(i)*I25f(i);
end
for i =1:i60
    pot60(i)= V60(i)*I60f(i);
end

figure;
plot(V60,pot60,'b', V0, pot0, 'g', V25, pot25, 'r');
grid on;
legend({'60°C', '0°C', '25°C'}, 'Location', 'northeast' )
xlabel('V');
ylabel('potencia');




