addpath(pwd)
addpath("../utils/")

M = [ 0.5, -1, 0;
     -1,    3, -1;
      0,   -1, 2];
b = [7, 4, 5]';#'

maxit = 1000;
tol = 1e-8;

[xj, itj, r_hj] = jacobi(M, b, b, maxit, tol);
[xg, itg, r_hg] = gaussseidel(M, b, b, maxit, tol);
[xs, its, r_hs] = sor(M, b, b, maxit, tol, 1.5);

disp("Jacobi: ");
disp(xj)
disp(["it = ", num2str(itj)]);
disp(["r_h = ", num2str(r_hj(end))]);
disp("Gauss-Seidel: ");
disp(xg)
disp(["it = ", num2str(itg)]);
disp(["r_h = ", num2str(r_hg(end))]);
disp("SOR: ");
disp(xs)
disp(["it = ", num2str(its)]);
disp(["r_h = ", num2str(r_hs(end))]);