addpath(pwd)
addpath("../utils")

f = @(x) x.^3 + 4 .* (x.^2) - 10;
g1 = @(x) 0.5 .* ((10 - x.^3) .^ 0.5);
g2 = @(x) (10 ./ (4+x)) .^0.5;
df = @(x) 3.*(x.^2) + 8 .* x;

x = linspace(1, 2, 40);
y = f(x);
y1 = g1(x);
y2 = g2(x);
[x1, h1] = puntofijo(g1, 1.5, 100, 1e-3);
[x2, h2] = puntofijo(g2, 1.5, 100, 1e-3);
[x3, h3] = newton(f, df, 1, 100, 1e-3);
disp(x1);
disp(x2);
disp(x3);
plot(x, y, "r", x, y1, "b", x, y2, "g")
line("xdata", [1, 2], "ydata", [0, 0], "lineWidth", 2)
line("xdata", [x1, x1], "ydata", [-3, 3], "lineWidth", 1, "color", "b")
line("xdata", [x2, x2], "ydata", [-1, 1], "lineWidth", 1, "color", "r")
line("xdata", [x3, x3], "ydata", [-0.5, 0.5], "lineWidth", 1, "color", "g")
pause;