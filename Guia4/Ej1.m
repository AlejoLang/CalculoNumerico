addpath(pwd)
addpath("../utils/")
func = @(x) 3 .* (x + 1) .* (x - 0.5) .* (x - 1);
x = linspace(-2, 2, 1000);
y = func(x);
xmin = -2;
xmax = 1.5;
plot(x, y)
line("xdata", [-2, 1.5], "ydata", [0, 0])

[p, h] = biseccion(func, xmin, xmax, 4, 1e-8);
disp(p);
disp(h(1, end))
line("xdata", [p, p],"ydata", [-1,1], "lineWidth", 1)
pause;