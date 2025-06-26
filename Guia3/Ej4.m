addpath("../utils")

A = [10,  5,  0,  0;
      5, 10, -4,  0;
      0, -4,  8, -1;
      0,  0, -1,  5];
b = [  6;
      15;
      11;
     -11];
x0 = [0;0;0;0];
tic;
[x,it,r_h] = sor(A, b, x0, 100, 1e-16, 1.166)
toc
tic;
[x,it,r_h] = gaussseidel(A, b, x0, 100, 1e-16)
toc
tic;
[x,it,r_h] = jacobi(A, b, x0, 100, 1e-16)
toc
