addpath(pwd)

s = [0, 1, 2, 3, 4, 5, 6];
c = [432, 599, 1012, 1909, 2977, 4190, 5961];

P = polyfit(s, c, 4);
f = @(x) polyval(P, x);

errCuad = norm(f(s) - c);
printf("Error cuadratico del ajuste: %.6f\n", errCuad);

y10 = 14900;
y10Est = f(10);
errRel = abs(y10 - y10Est) / abs(y10);
printf("Error relativo en 10 semanas: %.6f\n", errRel)

pause
