addpath(pwd)
addpath("../utils/")

f = @(x) x.^3 - x -  4;
x = linspace(1, 4, 100);
y = f(x);
plot(x, y);
line("xdata", [1, 4], "ydata", [0, 0])
xmin = 1;
xmax = 4;
[p, h] = biseccion(f, xmin, xmax, 1000, 1e-3);
disp(p);
disp(h(1, end))
line("xdata", [p, p],"ydata", [-1,1], "lineWidth", 1)
pause;