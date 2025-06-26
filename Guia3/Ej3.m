addpath("../utils")
A = [ 80, -50,  30,   0;
     -50, 100, -10, -25;
     -30, -10,  65, -20;
       0, -25, -20, 100];

b = [120;
       0;
       0;
       0];

x0 = [0;
      0;
      0;
      0];

[x,it,r_h] = jacobi(A, b, x0, 100, 1e-6);
disp(x)
disp("---------")
[x,it,r_h] = gaussseidel(A, b, x0, 100, 1e-6);
disp(x)
disp("---------")
[x,it,r_h] = sor(A, b, x0, 100, 1e-6, 1.2);
disp(x)
