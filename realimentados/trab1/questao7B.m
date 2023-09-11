close all

PI = tf([2.170*4.313 2.170], [4.313 0]);

Gv = tf([1.843], [4.313 1]);
Gtc = tf([-3.932], [3.995 1]);

GmfNaoLinearIn = (PI*Gv)/(1+Gv*PI);
GmfNaoLinearPerturbacao = (Gtc)/(1+Gv*PI);

GvLinear = tf([5.26*exp(i0)], [J*L (L*B + R*J) (R*B+K*exp(-abs(i0))*5.26)]);
GtcLinear = tf([-L -R], [J*L (L*B + R*J) (R*B+K*exp(-abs(i0))*5.26)])

GmfLinearIn = (PI*GvLinear)/(1+GvLinear*PI);
GmfLinearPerturbacao = (GtcLinear)/(1+GvLinear*PI);

%bode(GmfLinearIn, GmfNaoLinearIn)
%figure
%bode(GmfLinearPerturbacao, GmfNaoLinearPerturbacao)
%figure
%pzmap(GmfLinearIn, GmfNaoLinearIn)
%figure
%pzmap(GmfLinearPerturbacao, GmfNaoLinearPerturbacao)
%figure
step(GmfLinearIn, GmfNaoLinearIn)
figure
step(GmfLinearPerturbacao, GmfNaoLinearPerturbacao)
%figure
%step(GmfNaoLinearIn)
%figure
%step(GmfNaoLinearPerturbacao)