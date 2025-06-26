addpath(pwd)
addpath("../utils")

P = @(x) 1.0326e4;
w = 0.07;
s = 0.14;
J = (w * power(s, 3))/12
E = 2.10e11;
Nh = 200;
L = 5;
h = L / Nh

f = @(x) P(x)/(E * J);
M(1:Nh-3, 1:Nh-3) = 0;
f(1)
M = diag(ones(1, Nh -3)) * 6 + (diag(ones(1, Nh-4), -1) + diag(ones(1, Nh-4), 1)) * -4 + (diag(ones(1, Nh-5), -2) + diag(ones(1, Nh-5), 2) ) * 1
b(1:Nh-3, 1) = power(h, 4) * f(1) 
x0(1:Nh-3, 1) = 0;
[xS,itS,r_hS] = sor(M, b, x0, 10000, 1e-8,1);
disp(xS)
disp(itS)
disp(r_hS(itS)) 
x_nodes = linspace(0, L, Nh+1);   % Coordenadas x de los Nh+1 nodos
eta_full = zeros(Nh+1, 1);        % Vector completo de desplazamientos

% Insertamos la solución en los nodos interiores
eta_full(3:Nh-1) = xS;  % η2 hasta η(Nh-2)

% Graficamos
figure;
plot(x_nodes, eta_full, '-o', 'LineWidth', 2)
xlabel('x [m]')
ylabel('Desplazamiento vertical u(x) [m]')
title('Deformada de la viga biempotrada')
grid on
ylim([-0.0001 0.0001])  % <-- aquí fijas manualmente el eje y
pause;