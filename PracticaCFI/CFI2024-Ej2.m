addpath(pwd)
addpath("../utils")

F = @(x) [((2.*x)./(1-(x.^2))), -(42./(1-(x.^2))), 0.*x];
a = 1;
b = 1;
int = [-1 1];

L = 1000;
tol = 1e-8;
[x, y] = dif_fin_dir(F, int, [a b], L);
for i=1:10
    L = L * 2;
    [xi, yi] = dif_fin_dir(F, int, [a b], L);
    [m, idx] = min(abs(y));
    [mi, idxi] = min(abs(yi));

    if(abs(y(idx) - yi(idxi)) < tol) 
        x = xi;
        y = yi;
        break;
    endif 
    x = xi;
    y = yi;
endfor

[m, idx] = min(abs(x));
printf("Val en y(%.1f): %.6f\n", m, y(idx));

P = polyfit(x, y, 6);
printf("a0: %.3f\n", P(7));
printf("a1: %.3f\n", P(6));
printf("a2: %.3f\n", P(5));
printf("a3: %.3f\n", P(4));
printf("a4: %.3f\n", P(3));
printf("a5: %.3f\n", P(2));
printf("a6: %.3f\n", P(1));

f = @(x) polyval(P, x);
df = @(x) (P(1)*6).*(x.^5) + (P(2)*5).*(x.^4) + (P(3)*4).*(x.^3) + (P(4)*3).*(x.^2) + (P(5)*2).*x + P(6);

xmin = 0;
res = 0.1;
xmax = xmin + res;
fmin = f(xmin);
fmax = f(xmax);
raices = zeros(3);
#for i=1:3
#    while ((fmin * fmax) >= 0)
#        xmax += res;
#        xmin += res;
#        fmin = f(xmin);
#        fmax = f(xmax);
#    endwhile
#   printf("[%.8f, %.8f]\n", xmin, xmax);
#    [raiz, h] = secante(f, xmin, xmax, 100000, 1e-8);
#    raices(i) = raiz;
#    xmin = raiz + res;
#    xmax = raiz + 2*res;
#    fmin = f(xmin);
#    fmax = f(xmax);
#endfor
xmin = 0;
xmax = 0.1;
tol = 1e-12;
kmax = 10000;
for i=1:3
    while(f(xmin)*f(xmax) > 0)
        xmax += 0.01;
    endwhile
    [raiz, h] = newton(f, df, xmax, kmax, tol);
    raices(i) = raiz;
    xmin = raiz + 0.1;
    xmax = xmin + 0.1;
endfor

printf("Raiz menor: %.8f\n", raices(1));
printf("Raiz del medio: %.8f\n", raices(2));
printf("Raiz mayor: %.8f\n", raices(3));

x = linspace(-1, 1, 200);
plot(x, f(x));
pause
