addpath(pwd)
addpath("../utils/")

F = @(x) [ -(11/3).*(1./x), 1./(x.^2), log(x)-(8/3)];
a = 1;
b = 2.9736954;
int = [1 4];

tol = 1e-7;
L = 1000;
[x, y] = disparo_lineal(F, int, [a b], L);
for i=1:10
    L = L * 2;
    [xi, yi] = disparo_lineal(F, int, [a b], L);
    if(abs(yi(end) - y(end)) < tol)
        x = xi;
        y = yi;
        break
    endif
    x = xi;
    y = yi;
endfor

[m, idx] = min(abs(x-2.5));
printf("%.7f\n", y(idx));

df = (-y(idx + 2) + 8*y(idx + 1) - 8*y(idx - 1) + y(idx - 2)) / (12 * (x(idx+1)-x(idx)));

printf("%.7f\n", df)

Q = simpsoncomp(x, y);
printf("%.7f\n", Q)

plot(x, y);
hold on
plot(x, (df*x)+(y(idx)-(x(idx)*df)))
pause