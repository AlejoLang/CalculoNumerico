addpath(pwd)
addpath("../utils")

# a)

x = [0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4];
y = [0.0653, 0.066, 0.0657, 0.0651, 0.0635, 0.0611, 0.058, 0.0544];

M = [ones(length(x), 1), exp(x'), exp(-x')];
coef = M \ (1./y)';
a = coef(1);
b = coef(2);
c = coef(3);

f = @(x) 1./ (a + b.*exp(x) + c.*exp(-x));

printf("a: %.4f\n", a);
printf("b: %.4f\n", b);
printf("c: %.4f\n", c);

xp = linspace(0.1, 1.5, 100);

# b)
# Se iguala f a x/20 y se busca la raiz
g = @(x) (f(x) ./ x) - (1/20);
gp = g(xp);
plot(xp, gp);
hold on

kmax = 10000;
tol = 1e-7;
[raiz, h]= biseccion(g, 0.5, 1.5, kmax, tol);
printf("x/20 interseca a f en x=%.7f\n", raiz);

plot(xp, f(xp));
hold on
plot(xp, xp./20);
hold on
plot(raiz, f(raiz), 'ro');
legend("f=x/20", "f", "x/20", "punto")
figure

# c)
# El area entre las curvas es la resta de las integrales
# Se calcula el intervalo [0 raiz]
h = @(x) x./20;
a = 0;
b = raiz;
L = 100;
Qfin = intNCcompuesta(f, a, b, L, 3);
Qhin = intNCcompuesta(h, a, b, L, 3);
tol = 1e-7;
kmax = 100;
Qf = 0;
Qh = 0;
for i = 1:kmax
    L= L * 2;
    Qfac = intNCcompuesta(f, a, b, L, 3);
    Qhac = intNCcompuesta(h, a, b, L, 3);
    if((abs(Qfin - Qfac) < tol) && (abs(Qhin - Qhac) < tol))
        Qf = Qfac;
        Qh = Qhac;
        break;
    endif
    Qfin = Qfac;
    Qhin = Qhac;
endfor

printf("Integral f en [0 %.2f]: %.7f\n", raiz, Qf);
printf("Integral x/20 en [0 %.2f]: %.7f\n", raiz, Qh);
printf("Integral entre g y x/20 en [0 %.2f]: %.7f\n", raiz, Qf - Qh);

# Plots extras
yp = f(xp);
plot(xp, yp);
hold on
plot(x, y, 'rx');
pause