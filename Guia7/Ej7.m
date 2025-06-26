addpath(pwd)
addpath("../utils")

F = @(t, x) [0, -t; t, -t] * [x(1); x(2)];
F0 = [1, -1];
inter = [0 20];
L = (inter(2) - inter(1))/0.05;

[t, y] = euler(F, inter, F0, L);

plot(y(:,1), y(:,2))
pause