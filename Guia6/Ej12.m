addpath(pwd)
addpath("../utils")

u = @(r, t) 10 + (r.^3 .* cos(3.*t)) + (2 .* r.^2 .* sin(2.*t));
g = @(r, t) u(r, t) .* r;
R = 1;
a = -pi;
b = pi;

I1 = cuad_gauss_doble(g, a, b, 0, R, 3, 3);
printf("Int: %.8f\n", I1)