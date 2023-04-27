Vb = 0;


A = [0 1 0; ( ((M + m)*g)/(l*M) - (F*m)/(l*M*M) + (d*Vb*m)/(l*M*M) ) ( ((M+m)*b)/(M*M*l*l) ) (-d/(l*M)); ( -((F-d*Vb)*m)/(M*M) + m*g/M ) (-b/(l*M)) (-d/M) ];
B = [ 0 (1/(l*m)) 1/M ];
B = B';
C = [1 0 0];
D = [0]
I = A*inv(A);


%G = C*B*inv(s*I-A) + D;