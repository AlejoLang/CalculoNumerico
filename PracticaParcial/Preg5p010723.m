addpath(pwd)
addpath("../utils/")

f = @(x) sin(x) + cos(1 + x.^2) - 1;
df = @(x) cos(x) - 2 .* x .* sin(1 + x.^2);
kmax = 10000;
tol = 1e-10;

[xn, hn] = newton(f, df, 8, kmax, tol);
printf("x = %.10f\n", xn)