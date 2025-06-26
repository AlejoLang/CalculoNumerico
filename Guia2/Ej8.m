addpath(pwd)
addpath("../utils")
b = [1; 3; 2];

A1 = [8, 4, 1;
      2, 4, 8;
      2, 6, 2]

A2 = [5e-2, 5.57e+2, -4e-2;
      1.98e0, 1.94e+2, -3e-3;
      2.74e2, 3.11, 7.5e-2];

A3 = [1, 2, -1;
      2, 4, 0;
      0, 1, -1];

y = [1;1;1];

[A1M, r1] = doolittle_p(A1);
L1 = tril(A1M(r1,:), -1) + diag(ones(1, 3))
U1 = triu(A1M(r1,:))
b = b(r1, :);
y1 = sust_adelante([L1 b])
x1 = sust_atras([U1 y1])