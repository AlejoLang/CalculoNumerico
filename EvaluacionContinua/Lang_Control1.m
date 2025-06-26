addpath(pwd)
function [M, b] = crearMat(N)
    M(1:N, 1:N) = 0;
    M = M + 2 * eye(N);
    M = M - (diag(ones(1,N-1), -1) + diag(ones(1,N-1), 1));
    b(1:N, 1) = 1.5*[1:N] - 6;
endfunction

N =40;
[M , b] = crearMat(N);
x = gauss_p(M, b);
disp(["Valor x20: ", num2str(x(20, 1))]);


x0(1:N, 1) = 0;
[xJ, itJ, r_hJ] = jacobi(M, b, x0, 10000, 1e-5);
disp(["Iteraciones Jacobi: ", num2str(itJ)])
[xGS, itGS, r_hGS] = gaussseidel(M, b, x0, 10000, 1e-5);
disp(["Iteraciones Gauss-Seidel: ", num2str(itGS)])
[xS, itS, r_hS] = sor(M, b, x0, 10000, 1e-5, 1.85);
disp(["Iteraciones SOR: ", num2str(itS)])