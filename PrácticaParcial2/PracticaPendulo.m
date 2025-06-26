addpath(pwd)
addpath("../utils")

m1 = 1;
m2 = 3;
l = 15;
k = 3;
g = 9.81;



F = @(x, z) [
    z(2);
    -(g/l).*z(1)-(k/m1).*(z(1)-z(3));
    z(4);
    -(g/l).*z(3)+(k/m2).*(z(1)-z(3))
];

F0 = [0; -1; 0; 1];
int = [0 10];
h = 0.01;
L = (int(2) - int(1)) / h;

[x, y] = rk4(F, int, F0, L);

plot(x, y(:, 1));
hold on
plot(x, y(:, 3));
legend("Pendulo 1", "Pendulo 2")
pause
