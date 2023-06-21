function dxdt = func(h, H, F, D, B, L, QB, vec)

    MB=vec(1)
    M(2)=vec(2)
    M(3)=vec(3)
    M(4)=vec(4)
    M(5)=vec(5)
    M(6)=vec(6)
    M(7)=vec(7)
    M(8)=vec(8)
    M(9)=vec(9)
    M(10)=vec(10)
    M(11)=vec(11)
    M(12)=vec(12)
    M(13)=vec(13)
    M(14)=vec(14)
    Md = vec(15)

    XB=vec(16)
    X(2)=vec(17)
    X(3)=vec(18)
    X(4)=vec(19)
    X(5)=vec(20)
    X(6)=vec(21)
    X(7)=vec(22)
    X(8)=vec(23)
    X(9)=vec(24)
    X(10)=vec(25)
    X(11)=vec(26)
    X(12)=vec(27)
    X(13)=vec(28)
    X(14)=vec(29)
    Xd = vec(30)

   v(6) = ( h(6)*F + h(7)*l(7) + H(5)*v(5) - (l(7)+v(5)*h(6)) /(H(6)-h(6)) #FEEDTRAY
   v(14) = (hd * L + H(13)*v(13) - (L+V(13))*h(14) )/(H(14)-h(14)) #TOPTRAY
   v(2) = (h(3)*l(3) + HB*VB - (l(3)+VB)*h(2))/(H(2)-h(2)) #Bottom
   VB = (h(2)*l(2) + QB - hB*B -hB*(l(2) - VB - B))/(HB)

  for i = 2:5
    v(i) = (h(i+1)*l(i+1) + H(i-1)*v(i-1) - (l(i+1) + v(i-1))*h(i) )/(H(i) - h(i))
  endfor

  for i = 7:13
      v(i) = (h(i+1)*l(i+1) + H(i-1)*v(i-1) - (l(i+1) + v(i-1))*h(i) )/(H(i) - h(i))
  endfor

 #FEEDTRAY
  dM(6) = F + l(7) + v(5) - l(6) - v(6)
  dX(6) = ( l(7)*x(7) + v(5)*y(5) - ( l(7) + v(5))*x(6) - v(6)*(y(6)-x(6)))/(M(6))

  #TOPTRAY
  dM(14) = L + v(13) - l(14) - v(14)
  dX(14) = (L*xd + v(13)*y(13) - l(14)*x(14) - v(14)*y(14) - (L + v(13) - l(14) - v(14))*x(14))/(M(14))

  #Reflux drum and condenser
  dMd = v(14) - L - D
  dXd = (v(14)*y(14)-(L+D)*xd)-(v(14) - L - D)*xd/(Md)
  Qc = V(13)(H(13)-h(13))

  #BOTTOMTRAY
  dM(2) = l(3) - l(2) + VB - v(2)
  dX(2) = (l(3)*x(3) - l(2)*x(2) + VB*YB - v(2)*y(2) - (l(3) - l(2) + VB - v(2))*x(2) )/ (M(2))

  #Reboiler and column bottoms
  #The holdup is variable and changes in sensible heat cannot be neglected., dHb = 0

  dMB = l(2) - VB - B
  dXB = (l(2)*x(2) - VB*yB - B*xB - (l(2) - VB - B)*xB)/(MB)

  #GENERALTRAY
  #before feedtray
  for i = 2:5
    dM(i) = l(i+1) - l(i) + v(i-1) - v(i)
    dX(i) = (l(i+1)*x(i+1) + v(i-1)*y(i-1) - (l(i+1) + v(i-1)*x(i) - v(i)*(y(i)-x(i)) / (M(i))
  endfor

  #after feedtray
   for i = 7:13
    dM(i) = l(i+1) - l(i) + v(i-1) - v(i)
    dX(i) = (l(i+1)*x(i+1) + v(i-1)*y(i-1) - (l(i+1) + v(i-1)*x(i) - v(i)*(y(i)-x(i)) / (M(i))
  endfor

  dxdt = [dMB dM(2) dM(3) dM(4) dM(5) dM(6) dM(7) dM(8) dM(9) dM(10) dM(11) dM(12) dM(13) dM(14) dMd
          dXB dX(2) dX(3) dX(4) dX(5) dX(6) dX(7) dX(8) dX(9) dX(10) dX(11) dX(12) dX(13) dX(14) dXd]
