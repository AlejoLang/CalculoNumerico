addpath(pwd)

function df = cincopuntos(f, x, h)
    df = (-f(x + 2*h) + 8*f(x + h) - 8*f(x - h) + f(x - 2*h)) / (12 * h);
endfunction

# a)

cs = [1, 2, 3, 5, 7, 10, 15, 20];
r = [0.15, 0.33, 0.30, 0.35, 0.38, 0.42, 0.43, 0.45];
tr = 1./r;
tcs = 1./cs;
# 1/r = (1/rm) + (Km/(cs*rm))
M1 = [ones(length(cs), 1), tcs'];
coef1 = M1 \ tr';
# coef1(1) = rm
# coef1(2) = rm/Km;
rm1 = 1/coef1(1);
Km1 = rm1 * coef1(2);

f1 = @(x) 1./ ((1/rm1) + (Km1./(rm1.*x)));

printf("rm1: %.5f\n", rm1)
printf("Km1: %.5f\n", Km1)

x = linspace(1, 20, 300);
y1 = f1(x);

# r = rm - Km * (r/cs)
M2 = [ones(length(cs), 1), -tcs'];
coef2 = M2 \ r';
# coef(1) = rm2
# coef(2) = Km2*rm2;
rm2 = coef2(1);
Km2 = coef2(2) / rm2;

f2 = @(x) rm2 - (Km2 .* (rm2 ./ x));

printf("rm2: %.5f\n", rm2);
printf("Km2: %.5f\n", Km2);

# b)

valR = r(5);
err1 = abs(f1(7)-valR);
err2 = abs(f2(7) - valR);

printf("Error en 7 para el modelo 1: %.4f\n", err1);
printf("Error en 7 para el modelo 2: %.4f\n", err2);

# c)

printf("Velocidad de reacción en concentración alta de f1: %.5f\n", f1(10000));
printf("Velocidad de reacción en concentración alta de f2: %.5f\n", f2(10000));

# d)
dc = 10;
tol = 1e-3;
kmax = 10000;
df = @(x) cincopuntos(f1, x, 0.01) - tol;
[raiz, h] = biseccion(df, 1, 10000, 1000, 1e-6);
printf("Valor saturación: %.6f\n", raiz);
printf("dr/dcs en %.6f: %.6f\n", raiz, cincopuntos(f1, raiz, 0.02))

plot(cs, r, 'rx');
hold on
plot(x, y1)
hold on
plot(x, f2(x))
legend("Puntos", "f1", "f2")
pause
