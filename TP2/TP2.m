all clear
clc

% Question 2
kX = 11; kY = 12; kZ = 30;
dX = 0.7; dY = 0.7; dZ = 0.8;
m = 0.1;

% Ax = [0 1; -kX/m -dX/m];
% Bx = [0; 1/m];
% Cx = [1 0];

% Ay = [0 1; -kY/m -dY/m];
% By = [0; 1/m];
% Cy = [1 0];

% Az = [0 1; -kZ/m -dZ/m];
% Bz = [0; 1/m];
% Cz = [1 0];

A = [0 1 0 0 0 0; 
    -kX/m -dX/m 0 0 0 0;
     0 0 0 1 0 0;
     0 0 -kY/m -dY/m 0 0;
     0 0 0 0 0 1; 
     0 0 0 0 -kZ/m -dZ/m];
B = [0 0 0; 
     1/m 0 0;
     0 0 0; 
     0 1/m 0;
     0 0 0; 
     0 0 1/m];
C = [1 0 0 0 0 0;
     0 0 1 0 0 0;
     0 0 0 0 1 0];
D = [0 0 0;
     0 0 0; 
     0 0 0];

% Question 3
Con = ctrb(A, B);
rankCon = rank(Con);

Obs = obsv(A, C);
rankObs = rank(Obs);

% Question 3
% Controlabilite
% ConX = ctrb(Ax, Bx);
% rankConX = rank(ConX);

% ConY = ctrb(Ay, By);
% rankConY = rank(ConY);

% ConZ = ctrb(Az, Bz);
% rankConZ = rank(ConZ);

% Observabilite
% ObsX = obsv(Ax, Cx);
% rankObsX = rank(ObsX);

% ObsY = obsv(Ay, Cy);
% rankObsY = rank(ObsY);

% ObsZ = obsv(Az, Cz);
% rankObsZ = rank(ObsZ);

% disp('Rank de Controlabilite e Observabilite pour les trois axes:');
% disp(['X - Controlabilite: ', num2str(rankConX), ' | Observabilite: ', num2str(rankObsX)]);
% disp(['Y - Controlabilite: ', num2str(rankConY), ' | Observabilite: ', num2str(rankObsY)]);
% disp(['Z - Controlabilite: ', num2str(rankConZ), ' | Observabilite: ', num2str(rankObsZ)]);

% Question 4
plot3(out.simout.signals.values(1:end, 1), out.simout.signals.values(1:end, 2), out.simout.signals.values(1:end, 3) );

t = out.simout.time; 
x = out.simout.signals.values(:, 1); % posição x(t)
y = out.simout.signals.values(:, 2); % posição y(t)
z = out.simout.signals.values(:, 3); % posição z(t)

figure;
subplot(3,1,1);
plot(t, x);
xlabel('Temps (s)');
ylabel('x(t)');
title('Réponse du système à x(t)');
grid on;

subplot(3,1,2);
plot(t, y);
xlabel('Temps (s)');
ylabel('y(t)');
title('Réponse du système à y(t)');
grid on;

subplot(3,1,3);
plot(t, z);
xlabel('Temps (s)');
ylabel('z(t)');
title('Réponse du système à z(t)');
grid on;

% Question 5
polesOriginal = eig(A);
disp(polesOriginal);

polesObservateur = 10 * polesOriginal;
disp(polesObservateur);

L = (place(A', C', polesObservateur))';

disp('Matrice de gain L pour Observateur: ');
disp(L);

% Question 6
% Simulation

% Question TP3
% Polos para x e y (segunda ordem, amortecimento = 0.8, wn = 300 rad/s)
% pXY = wn * (-amortecimento +- j*raizQuadrada(1 - (amortecimento)^2))
polosXY = [-240 + 180j, -240 - 180j];

poloZ = [-30, -30];

polosAlterados = [polosXY, polosXY, poloZ];

K = place(A, B, polosAlterados);

disp('Matriz de ganho K: ');
disp(K);