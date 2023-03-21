clc;
clear all;
close all
setup;

T = Tn; 

V = (0:0.01:1);
 
 I0 = zeros(size(V));
 I25 = zeros(size(V));
 I60 = zeros(size(V));
 %Ipv = zeros(1,100);
 %Id = zeros(1,100);
 %Ip = zeros(1,100);
 
 
 q = 1.602*(10^(-19)); %[C]
 k = 1.38 *(10^(-23));
 Vt = k*T/q;

 %%
 lambida = 0.1;
 %%
 
 G = 200;
 for i = 1:1:101
     var = 0.05; 
     Vat = V(i);
     
    Inov = subrelax(var, lambida, G, T, Vat, Vt);
      
    
      I200(i) = Inov;
 end
 
 for i200 = 1:101
     if I200(i200) < 0
         break
     end
 end
 
 I200f = zeros(1,i200);
 for i = 1:i200
     I200f(i) = I200(i);
 end    
 
  
 V200 = zeros(1,i200);
 for i = 2:i200
     V200(i)=V200(i-1) + 0.01;
 end
%%

 G = 500;
 for i = 1:1:101
     var = 0.05; 
     Vat = V(i);
     
    Inov = subrelax(var, lambida, G, T, Vat, Vt);
     
      I500(i) = Inov;
 end

 for i500 = 1:101
     if I500(i500) < 0
         break
     end
 end
 
 I500f = zeros(1,i500);
 for i = 1:i500
     I500f(i) = I500(i);
 end    
 
  
 V500 = zeros(1,i500);
 for i = 2:i500
     V500(i)=V500(i-1) + 0.01;
 end
 
%%
G = 1000;
for i = 1:101
   var = 0.05; 
     Vat = V(i);
     
    Inov = subrelax(var, lambida, G, T, Vat, Vt);
    
     I1000(i) = Inov;
end 

for i1000 = 1:101
     if I1000(i1000) < 0
         break
     end
 end
 
 I1000f = zeros(1,i1000);
 for i = 1:i1000
     I1000f(i) = I1000(i);
 end    
 
  
 V1000 = zeros(1,i1000);
 for i = 2:i1000
     V1000(i)=V1000(i-1) + 0.01;
 end
%%
figure;
plot(V200,I200f,'b', V500, I500f, 'g', V1000, I1000f, 'r');
grid on;
legend({'200W/m^2','500W/m^2','1000W/m^2'},'Location','northeast');
xlabel('V');
ylabel('I');


pot200 = zeros(size(V200));
pot500 = zeros(size(V500));
pot1000 = zeros(size(V1000));
for i = 1:i200
    pot200(i)= V200(i)*I200f(i);
end
for i = 1:i500
    pot500(i)= V500(i)*I500f(i);
end
for i = 1:i1000
    pot1000(i)= V1000(i)*I1000f(i);
end

figure;
plot(V200,pot200,'b', V500, pot500, 'g', V1000, pot1000, 'r');
xlabel('V');
ylabel('potencia');
legend({'200W/m^2','500W/m^2','1000W/m^2'},'Location','northeast');
grid on;




