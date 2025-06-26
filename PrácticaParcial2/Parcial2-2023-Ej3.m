addpath(pwd)
addpath("../utils")

f = @(x) 2 + cos(pi .* x);
df = @(x) -pi .* sin(pi .* x);
int = [0 2];

aux = @(x) 2 .* pi .* f(x) .* sqrt(1 + (df(x) .^ 2));

Q = cuad_gauss_c(aux, int(1), int(2), 40, 3);
printf("La superficie es de %.10f\n", Q);
printf("%.10f\n", cuad_gauss_c(aux, int(1), int(2), 35, 3));
printf("%.10f\n", cuad_gauss_c(aux, int(1), int(2), 45, 3));