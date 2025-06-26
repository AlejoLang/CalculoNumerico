addpath(pwd)
addpath("../utils")

F = @(t, x) [x(1) * (3 - 0.002*x(2)); -x(2)*(0.5-0.0006*x(1))];
F0 = [1600; 800];
int = [0 24];
h = 0.001;
L = (int(2) - int(1)) / h;
[t, y] = euler(F, int, F0, L);
disp(y)
plot(t, y(:,1));
hold on
plot(t, y(:, 2));
legend("Presa", "Depredador")
pause
