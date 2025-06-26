addpath(pwd)
addpath("../utils")

m1 = 1;
m2 = 3;
k1 = 3;
k2 = 4;

F = @(t, z) [
    z(2);
    -(k1/m1).*z(1)+(k2/m1).*(z(3)-z(1));
    z(4);
    -(k2/m2).*(z(3)-z(1))
];
F0 = [0; 1; 0; 1];
int = [0 20];
L = 100;
[tin, yin] = rk4(F, int, F0, L);
t = [];
y = [];
tol = 1e-8;
maxit = 100;
for i = 1:maxit
    L = L * 2;
    [tac, yac] = rk4(F, int, F0, L);
    if ((abs(yac(end, 1) - yin(end, 1)) < tol) && (abs(yac(end, 3) - yin(end, 3)) < tol))
        t = tac;
        y = yac;
        break;
    endif
    tin = tac;
    yin = yac;
    i = i + 1;
    if(i > maxit) break; endif
endfor

printf("x1 a 20 seg: %.8f\n", y(end, 1));
if(y(end, 2) > 0)
    printf("x1 moviendose hacia la derecha\n");
elseif(y(end, 2) < 0)
    printf("x1 moviendose hacia la izquierda\n");
endif

printf("x2 a 20 seg: %.8f\n", y(end, 3));
if(y(end, 4) > 0)
    printf("x2 moviendose hacia la derecha\n");
elseif(y(end, 4) < 0)
    printf("x2 moviendose hacia la izquierda\n");
endif

