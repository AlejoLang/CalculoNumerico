addpath(pwd)
addpath("../utils")

K0 = 1;
cR = @(x) 2 + (x.*0);
f = @(x) 20 .* sin(5.*(x-1));
l = 3;

F = @(x) [0.*x, (cR(x)./K0), -(f(x)./K0) ];
int = [0 l];
h = 0.01;
L = (int(2) - int(1)) / h;
rob = [1 0 0];
[x, y] = dif_fin_rob(F, int, 21, rob, L);

printf("Temp extremo derecho: %.6f\n", y(end));

df = (y(2) - y(1)) / (x(2) - x(1));
printf("Flujo: %.6f\n", -df * K0)

plot(x, y)
hold on
plot(x, (df*x)+y(1))
pause

