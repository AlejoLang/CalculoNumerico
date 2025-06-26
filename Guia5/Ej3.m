addpath(pwd)
addpath("../utils/")

x = [0, 1, 3/2, 2];
y = [3, 3, 13/4, 5/4];

tic;
c = dif_div(x, y)
toc
xd = linspace(-1, 3, 100);
yd = evDD(x, c, xd);
y2 = evLagrange(x, y, xd);
plot(xd, yd, x(1), y(1), 'o-r', x(2), y(2), 'o-r', x(3), y(3), 'o-r', x(4), y(4), 'o-r');
figure()
plot(xd, y2)
hold on
line([-1 3], [13/4 13/4], 'color', 'k')
line([-1 3], [5/4 5/4], 'color', 'k')
line([-1 3], [3 3], 'color', 'k')

pause;