addpath(pwd)
addpath("../utils/")
function [A, b] = createMat(N)
  A(1:N,1:N)=0;
  b(1:N, 1) = 1/pow2(N);
  diagPrinc = diag(ones(1, N)) * 2;
  diagSup = diag(ones(1,N-1),1) * -1;
  diagInf = diag(ones(1,N-1), -1) * -1;
  A = diagPrinc + diagSup + diagInf;
  A(1, 1:N) = 0; A(1,1) = 1;
  A(N, 1:N) = 0; A(N,N) = 1;
  b(1) = 0;
  b(N) = 0;
endfunction

N = 100;

[M, b] = createMat(N);
x = gauss1(M, b);
t = linspace(0, 1, N);
plot(t,x);
pause;
