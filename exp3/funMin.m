

##Rai = x(1);
##Rei = x(2);
##Rec = x(3);
##Rcp = x(4);
##Ci = x(5);
##Ce = x(6);
##Cc = x(7);
##gamma = x(8);
##Rca = x(9);

##TiAvg = mean(vecTi);
##TeAvg = mean(vecTe);
##TcAvg = mean(vecTc);
##
##ret = 0; % erro quadrático total
##
##% saídas estimadas
##vecTi_em = zeros(size(vecTi));
##vecTe_em = zeros(size(vecTe));
##vecTc_em = zeros(size(vecTc));
##
##% condições iniciais
##vecTi_em(1) = vecTi(1);
##vecTe_em(1) = vecTe(1);
##vecTc_em(1) = vecTc(1);

phi = [];
Y = [];
tetha_chapeu=[];

vecTheta1 = [];
vecTheta2 = [];
vecTheta3 = [];
vecTheta4 = [];
vecTheta5 = [];
vecTheta6 = [];
vecTheta7 = [];
vecTheta8 = [];
vecTheta9 = [];

for k=2:length(vecTa)
   phi = [ phi; 
           (-vecTi(k-1)+vecTa(k-1)), (vecTe(k-1)-vecTi(k-1)), vecS(k-1), 0, 0, 0, 0, 0, 0;
           0, 0, 0, (vecTi(k-1)-vecTe(k-1)), (-vecS(k-1)*(vecTe(k-1)+vecTc(k-1))), 0, 0, 0, 0;
           0, 0, 0, 0, 0, vecS(k-1)*vecFreq(k-1), -vecS(k-1)*vecTc(k-1), (-vecS(k-1)*(vecTc(k-1)+vecTe(k-1))), (vecTa(k-1)-vecTc(k-1))];

   Y = [Y;
       (vecTi(k) -vecTi(k-1));
       (vecTe(k) -vecTe(k-1)); 
       (vecTc(k) -vecTc(k-1))];
       
   tetha_chapeu = inverse(transpose(phi)*phi)*transpose(phi)*Y
   
    vecTheta1(k-1) = tetha_chapeu(1);
    vecTheta2(k-1) = tetha_chapeu(2);
    vecTheta3(k-1) = tetha_chapeu(3);
    vecTheta4(k-1) = tetha_chapeu(4);
    vecTheta5(k-1) = tetha_chapeu(5);
    vecTheta6(k-1) = tetha_chapeu(6);
    vecTheta7(k-1) = tetha_chapeu(7);
    vecTheta8(k-1) = tetha_chapeu(8);
    vecTheta9(k-1) = tetha_chapeu(9);
end

vecRange = zeros(size(vecTheta1));

for k = 1:length(vecTheta1)
  vecRange(k)=k;
endfor



%tetha_chapeu_final = inverse(transpose(phi)*phi)*transpose(phi)*Y;
    

%saídas estimadas
vecTi_e = zeros(size(vecTi));
vecTe_e = zeros(size(vecTe));
vecTc_e = zeros(size(vecTc));

%Simulação no tempo discreto
%condições iniciais
vecTi_e(1) = vecTi(1);
vecTe_e(1) = vecTe(1);
vecTc_e(1) = vecTc(1);

for k=2:length(vecTi)
  
    vecTi_e(k) = [(-vecTi_e(k-1)+vecTa(k-1)), (vecTe_e(k-1)-vecTi_e(k-1)), vecS(k-1), 0, 0, 0, 0, 0, 0]*tetha_chapeu +vecTi_e(k-1);
    vecTe_e(k) = [0, 0, 0, (vecTi_e(k-1)-vecTe_e(k-1)), (-vecS(k-1)*(vecTe_e(k-1)+vecTc_e(k-1))), 0, 0, 0, 0]*tetha_chapeu + vecTe_e(k-1);
    vecTc_e(k) = [0, 0, 0, 0, 0, vecS(k-1)*vecFreq(k-1), -vecS(k-1)*vecTc_e(k-1), (-vecS(k-1)*(vecTc_e(k-1)+vecTe_e(k-1))), (vecTa(k-1)-vecTc_e(k-1))]*tetha_chapeu + vecTc_e(k-1); 
  
  
endfor
figure
set(gcf,'name','Temperaturas')
plot(vecTime/3600,vecTa-CtoK)
grid on
hold on
plot(vecTime/3600,vecTi_e-CtoK)
plot(vecTime/3600,vecTe_e-CtoK)
plot(vecTime/3600,vecTc_e-CtoK)
xlabel('tempo [h]')
ylabel('temperatura [°C]')
lh = legend('amb.','int.','evap.','cond.');
set(lh,'location','best')
    