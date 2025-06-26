addpath(pwd)
addpath("../utils")
function [M] = crearMat(N)
    M = diag([2:2:2*N]);
    M = M + (diag(ones(1, N-2), -2) * 0.5) + (diag(ones(1, N-2), 2) * 0.5);
    M = M + (diag(ones(1, N-4), -4) * 0.25) + (diag(ones(1, N-4), 4) * 0.25);
endfunction
N = 1000;
M = crearMat(N);
b = ones(N, 1) * pi;
x0 = ones(N, 1) * 0;

disp("Jacobi:")
tic;
[xJ,itJ,r_hJ] = jacobi(M, b, x0, 100, 1e-10);
toc
disp(["It: ", num2str(itJ)]);
disp(["Err: ", num2str(r_hJ(itJ))]);
disp("")

disp("Gauss-seidel:")
tic;
[xGS,itGS,r_hGS] = gaussseidel(M, b, x0, 100, 1e-10);
toc
disp(["It: ", num2str(itGS)]);
disp(["Err: ", num2str(r_hGS(itGS))]);
disp("")

D = diag(diag(M));
L = tril(M, -1);
U = triu(M, 1);
T = inv(D) * (L + U);
u = max(abs(eig(T)));
wopt = 1+ power((u/1+sqrt(1-power(u,2))), 2);
wopt2 = 2/(1+sqrt(1-power(u,2)));

disp("SOR:")
tic;
[xS,itS,r_hS] = sor(M, b, x0, 100, 1e-10, wopt2);
toc
disp(["It: ", num2str(itS)]);
disp(["Err: ", num2str(r_hS(itS))]);

disp(sprintf("Wopt: %.8f", wopt2));
semilogy([1:itJ], r_hJ(1:itJ), 'r-o',
         [1:itGS], r_hGS(1:itGS), 'b-s',
         [1:itS], r_hS(1:itS), 'g-^');
legend("Jacobi", "Gauss-Seidel", "SOR")
pause;