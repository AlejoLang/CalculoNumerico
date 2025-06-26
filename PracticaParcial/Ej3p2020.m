addpath(pwd)
addpath("../utils/")
f = @(x) sin(x) + cos(1 + x.^2) - 1;
df = @(x) cos(x) - 2 .* x .* sin(1 + x.^2);
s = 1;
maxit = 10000;
tol = 1e-6;

[xn, hn] = newton(f, df, s, maxit, tol);
disp(xn)
disp(hn(end))
x = linspace(-10, 10, 1000);
y = f(x);
plot(x, y)
line([xn, xn], [-1, 1], "color", "red")
line([-10, 10], [0, 0], "color", "black")
pause;
