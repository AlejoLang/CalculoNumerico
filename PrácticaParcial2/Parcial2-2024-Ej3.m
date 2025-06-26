addpath(pwd)
addpath("../utils")

a = @(t) [cos(t), 3 .* sin(t)];

function res = normda(x)
    da = @(t) [sin(t(:)), -3.* cos(t(:))];
    mat = da(x');
    res = sqrt(sum(mat.^2,2))';
endfunction
f = @(t) normda(t);
int = [0 2*pi];
Q = intNCcompuesta(f, int(1), int(2), 1000, 3);
Q2 = intNCcompuesta(f, int(1), int(2), 7, 2);
printf("Integral: %.11f\n", Q)

printf("Q2: %.11f\n", Q2);
