addpath(pwd)
addpath("../utils/")
M = [ 3,  0,  2,  0,  1;
      1,  2,  2, -2,  2;
     -2,  2,  3, -1,  1;
      1, -1, -1,  3, -1;
     -1, -2,  2, -2,  1];

b = [3, 4, 1, -2, 5]';#'

x0 = [0, 0, 0, 0, 0]';#'
maxit = 10000;
tol = 1e-4;

[x, r] = gauss_p(M, b);
disp("x = ")
disp(x);
disp("")
disp("Verificación (A*x - b):")
disp((M * x) - b);
disp("----------")

[xj, itj, r_hj] = jacobi(M, b, x0, maxit, tol);
[xgs, itgs, r_hgs] = gaussseidel(M, b, x0, maxit, tol);
disp(["Iteraciones Jacobi: ", num2str(itj)]);
disp("x = ")
disp(xj);
disp("Verificación (M*xj - b):")
disp((M* xj) - b)
disp("")
disp(["Iteraciones Gauss-Seidel: ", num2str(itgs)]);
disp("x = ")
disp(xgs)
disp("Verificación (M*xgs - b)");
disp((M * xgs) - b);
disp("--------------");

disp("Error relativo Gauss-Jacobi:")
err = norm(x-xj, "inf") / norm(x,"inf");
printf("e = %.6f\n", err);