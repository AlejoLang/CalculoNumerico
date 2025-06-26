addpath(pwd)
addpath("../utils")

ddu = @(x) [0.*x, 0.*x, -(20.*sin(5.*x-5))];
yc = [21 0];
int = [0 3];
h = 0.001;
L = (int(2) - int(1)) / h;
[x, y] = dif_fin_rob(ddu, int, yc(1), [-1 0 0], L);
[x2, y2] = disparo_lineal(ddu, int, yc, L);
printf("%.10f\n", y(end))
printf("%.10f\n", max(y))
