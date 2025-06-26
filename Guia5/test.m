addpath(pwd)
addpath("../utils/")
x = [2, 2.5, 4];
y = [0.5, 0.4, 0.25];

c = dif_div(x, y)
xp = linspace(1, 5, 200);
yp = evDD(x, c, xp);
plot(xp, yp);
hold on
plot(x(1), y(1), 'r-o')
hold on
plot(x(3), y(3), 'r-o')
hold on
plot(x(3), y(3), 'r-o')
pause
