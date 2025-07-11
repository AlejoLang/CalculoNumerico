addpath(pwd)
addpath("../utils")

K0 = 1;
cR = @(x) 2 + (x.*0);
f = @(x) 20 .* sin(5.*(x-1));
l = 3;
H = 5;
uE = 10;

F = @(x) [0.*x, 0.*x, -(f(x)./K0) ];
int = [0 l];
h = 0.001;
L = (int(2) - int(1)) / h;
rob = [K0 H H*uE];
[x, y] = dif_fin_rob(F, int, 21, rob, L);

printf("Temp extremo derecho: %.6f\n", y(end));

df = (y(end) - y(end-1)) / h;
printf("Flujo: %.6f\n", -df * K0)

plot(x, y)
hold on
plot(x, (df*x)+(y(end)-(x(end)*df)))
pause

