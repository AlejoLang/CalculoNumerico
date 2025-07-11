addpath(pwd)
addpath("../utils")

K0 = 1;
cR = @(x) (0.5 .* x) + 0.5;
f = @(x) 20 .* sin(5.*(x-1));
l = 3;

F = @(x) [0.*x, (cR(x)./K0), -(f(x)./K0) ];
F0 = [21 0];
int = [0 l];
h = 0.01;
L = (int(2) - int(1)) / h;

a = @(x) F(x)(:, 2);

[x, y] = dif_fin_rob(F, int, 21, [1 0 0], L);
[x2, y2] = disparo_lineal(F, int, F0, L);

printf("Temp en punto medio: %.6f\n", y(ceil(length(y)/2)))
printf("Temp en punto medio: %.6f\n", y2(ceil(length(y2)/2)))
plot(x,y)
hold on
plot(x2, y2)
legend("Robin", "Disparo lineal")
pause