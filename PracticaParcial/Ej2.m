addpath(pwd)
addpath("../utils")
M = [ 1,  2, -2, -1,  0;
     -1,  3, -1, -1, -2;
      0, -2,  3,  2,  0;
     -1,  0, -1,  2, -1;
      2,  0, -2, -1,  3];

b = [1, -2, 5, 5, -1]';#'
x0 = [0, 0, 0, 0, 0]';#'
[x] = gauss_p(M, b);
disp(x)

[xj, itj, r_hj] = jacobi(M, b, x0, 100, 1e-4);
disp("JACOBI: ")
disp(xj);
disp(itj);
disp("---------")
[xgs, itgs, r_hgs] = gaussseidel(M, b, x0, 10000, 1e-4);
disp("GAUSS SEIDEL: ")
disp(xgs);
disp(itgs);
disp("---------")
printf("Dif Jacobi y Gauss relativo: %.5f\n", (norm(xj - x, "inf") / norm(x, "inf")))