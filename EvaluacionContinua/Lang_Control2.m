addpath(pwd)
addpath("../utils/")
f = @(x) (0.04.* sqrt(x + 0.02) .* (1- 0.02) - 0.02 .* sqrt(3.*x))- 0.02;
df = @(x) ((1- x) ./ (50 * sqrt(x+0.02)) - ((1/25) * sqrt(0.02 + x)) - sqrt(3.*x));
kmax = 10000;
tol = 1e-6;
[xn, hn] = newton(f, df, 19, kmax, tol);
printf("x = %.6f\n, it: %i\n", xn, length(hn))
[xb, hb] = biseccion(f, 10, 30, kmax, tol);
disp(length(hb))
printf("a = %.6f\n", xb)
h = @(t) 0.04 .* sqrt(xb + t) .* (1-t) - t .* sqrt(3 .* xb);
disp(num2str(h(0.02)))
[xs, hs] = secante(h, 0, 10, kmax, tol);
printf("f(x)= 0 => x = %.6f\n", xs)