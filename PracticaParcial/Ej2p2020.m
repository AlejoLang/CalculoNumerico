addpath(pwd)
addpath("../utils")

f = @(x) x + exp(-10 .* (x .^ 2)) .* cos(x)
df = @(x) 1 - 20 .* x .* exp(-10 .* (x .^ 2)) .* cos(x) - exp(-10 .* (x .^ 2)) .* sin(x)
s = 0;
maxit = 10000;
tol = 1e-6;

[xn, hn] = newton(f, df, s, maxit, tol);
disp(xn)
disp(hn(end))
disp(length(hn))