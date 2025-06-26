addpath("../utils")
A = [3, 1,  1;
     1, 3, -1;
     3, 1, -5];

B = [3, 1,  1;
     3, 1, -5;
     1, 3, -1];

b = [5;3;-1];
v = [5;-1;3];
x0=[0;0;0];
;
[x,it,r_h] = gaussseidel(A, b, x0, 100, 1e-16)
[x,it,r_h] = gaussseidel(B, v, x0, 100, 1e-16)
x = gauss1(A, b)
x = gauss_p(B, v)