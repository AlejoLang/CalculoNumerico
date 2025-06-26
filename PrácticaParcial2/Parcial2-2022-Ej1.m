addpath(pwd)
addpath("./utils")

x = [-1, 0, 1, 2];
y = [-1.1, -0.4, -0.9, -2.7];

lny = log(-y);
P = polyfit(x, lny, 2);

f = @(x) -exp(polyval(P, x));

err = norm(f(x)-y, 2);
printf("Error cuadrático: %.6f\n", err);

errx0 = abs(y(2) - f(x(2))) / abs(y(2));
printf("Error al aproximar x=0: %.6f\n", errx0);

xp = linspace(-1.5, 2.5, 200);
yp = f(xp);
plot(xp, yp)
hold on
plot(x, y, 'rx')
ylim([-5 5])
pause