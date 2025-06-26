addpath("../utils")

A = [ 1, -2,  3,  0;
      3, -6,  9,  3;
      2,  1,  4,  1;
      1, -2,  2, -2];

[M, r] = doolittle_p(A)
M = M(r, :);
L1 = tril(M, -1) + diag(ones(1, 4))
U1 = triu(M)
disp( L1 * U1 )
