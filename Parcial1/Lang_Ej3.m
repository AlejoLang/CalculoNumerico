addpath(pwd)
addpath("../utils/")
f1 = 440;
f2 =660;
f3 = 1100;
f4 = 5;
f5 = 8;
s = @(f, t) sin(2 .* pi .* f .* t);
s1 = @ (f, t) cos(2 .* pi .* f .* t);

M = [s(f1, 0),      s(f2, 0),      s(f3, 0),      s1(f4, 0),      s(f5, 0);
     s(f1, 0.0025), s(f2, 0.0025), s(f3, 0.0025), s1(f4, 0.0025), s(f5, 0.0025);
     s(f1, 0.005),  s(f2, 0.005),  s(f3, 0.005),  s1(f4, 0.005),  s(f5, 0.005);
     s(f1, 0.0075), s(f2, 0.0075), s(f3, 0.0075), s1(f4, 0.0075), s(f5, 0.0075);
     s(f1, 0.01),   s(f2, 0.01),   s(f3, 0.01),   s1(f4, 0.01),   s(f5, 0.01)];

b = [2.1004, 4.3702, 5.1745, -0.7222, 0.9249]';#'

[x, r] = gauss_p(M, b);
disp("x = ")
disp(x)
disp("Verificación: ")
disp((M * x) -b)

Mr =  M(r,:);
br = b(r,:);
x0 = [0, 0, 0, 0, 0]';#'
tol = 1e-4;
maxit = 10000;
itmin = 10000;
wmin = 0;
for w=0:0.01:2
    [xs, its, r_hs] = sor(Mr, br,x0, maxit, tol, w);
    if(its <= itmin) 
        itmin = its;
        wmin = w;
    endif
endfor

printf("w optimo: %.2f\n", wmin);
printf("iteraciones: %i\n", itmin);