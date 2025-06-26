addpath(pwd)
addpath("../utils/")

function [M, b] = crearSist(N)
    h = 1 / (N + 1);
    M(1:N, 1:N) = 0;
    b(1:N) = h^2 .* 20 .* exp(-10 .* ([1:N] .* h -0.7).^2);
    b(1) += 5;
    b(N) += 6;
    b = b'#'
    M += diag(2 * ones(N, 1));
    M += diag(-1 * ones(N-1, 1), 1);
    M += diag(-1 * ones(N-1, 1), -1);
endfunction
N = 39
x0 = zeros(N, 1);
[M, b] = crearSist(N);
[xgs, itgs, r_hgs] = gaussseidel(M, b, x0,  10000, 1e-6);
disp("Gauss Seidel: ")
printf("x = %.6f\n", xgs)
printf("it = %i\n", itgs)
printf("r_h = %.6f\n", r_hgs(itgs))
printf("xmed = %.6f\n", xgs(ceil(N/2)))

printf("xmed = %.6f\n", xgs(floor(N/2)))
