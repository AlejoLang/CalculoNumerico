addpath(pwd)
addpath("../utils")

f = @(x) (20 .* x) - (x.^3 ./ 5);
df = @(x) 20 - ((3/5) .* x.^2);
a = 0;
b = 2;
g = @(x) 2 .* pi .* f(x) .* sqrt(1 + df(x).^2);

Icg = cuad_gauss_c(g, a, b, 1, 3);
Itc5 = intNCcompuesta(g, a, b, 6, 2);
Isc5 = intNCcompuesta(g, a, b, 6, 3);
IQ = quad(g, a, b);
printf("Integral con cuadratura de Gauss: %.6f\n", Icg);
printf("Integral con trapecio compuesta L=5: %.6f\n", Itc5);
printf("Integral con simpson compuesta L=5: %.6f\n", Isc5);
printf("Integral con quad(): %.6f\n", IQ)


