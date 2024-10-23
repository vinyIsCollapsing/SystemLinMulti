R = 1;
L = 4*10^(-3);
K = 0.1;
F = 3*10^(-3);
J = 2*10^(-3);

A = [-R/L -K/L 0; K/J -F/J 0; 0 1 0];
B = [1/L; 0; 0];
C = [0 0 1];
D = 0;

sys = ss(A, B, C, D);
[num, den] = ss2tf(A, B, C, D);
TF = tf(num, den);

zeros = [12500];
polos = [1 251.5 1625 0];

r = roots(polos);