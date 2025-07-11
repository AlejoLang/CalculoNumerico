addpath(pwd)
addpath("../utils")

l = 2;
A = 0.01;
c = 0.217;
ro = 2.7;
K0 = 0.57;
f = @(x) 12.*cos(2.*x);
cR = @(x) 5.*(x - 2);
alpha = 6;

F = @(x) [0.*x, (cR(x)./K0), -(f(x)./K0)];
rob = [-K0 0 -40];
int = [0 l];

[x, y] = dif_fin_rob(F, int, alpha, rob, 32000);
df0 = (y(2)-y(1))/(x(2)-x(1));
printf("%.4f\n",-K0*df0)

E = A * c * ro * simpsoncomp(x, y);
printf("%.6f\n", E)

betaa = 20/K0;

F2 = @(x, z) [
    z(2)
    ((cR(x)./K0).*z(1))-(f(x)./K0)
];
[x2, y2] = rk4(F2, int, [alpha betaa], 16000);
printf("%.7f\n", y2(end, 1))
printf("%.7f\n", -K0*y2(end,2))

plot(x, y);
hold on
plot(x, (df0.*x)+y(1))
pause