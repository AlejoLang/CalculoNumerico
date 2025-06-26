addpath(pwd)
addpath("../utils/")

x = [1, 2, 3];
f = [0, 4, 22/3];
df = [3, 3];

[S, dS, dd] = funcion_spline(x, f, df(1), df(2))
xp = linspace(1, 3, 100);
y = S(xp);
plot(x(1), f(1), 'o-r')
hold on
plot(x(2), f(2), 'o-r')
hold on
plot(x(3), f(3), 'o-r')
hold on
plot(xp, y);
pause