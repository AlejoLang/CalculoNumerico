addpath(pwd)
addpath("../utils")

m = 20;
k = 20;
c = 10;

F = @(t, z) [
    z(2);
    -(c/m).*z(2)-(k/m).*z(1)
];
F0 = [1; 0];

int = [0 10];
h = 0.01;
L = (int(2) - int(1)) / h;

[x, y] = rk4(F, int, F0, L);

printf("%.5f", y(end, 1));

plot(x, y(:, 1));
pause