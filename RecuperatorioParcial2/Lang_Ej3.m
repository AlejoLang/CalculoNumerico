addpath(pwd)

# a)
L = 30;
m = 68.1;
cd = 0.25;
k = 40;
y = 8;
g = 9.81;

f1 = @(t, z) g - (((sign(z(2)) .* cd .* (z(2).^2)))./m);
f2 = @(t, z) f1(t, z) - ((k .* (z(1) - L))./m) - (((y .* z(2)))./m);
F = @(t, z) [
    z(2);
    ((abs(z(1)) <= L).*f1(t, z) + (abs(z(1)) > L).*f2(t, z))
];
F0 = [0; 0];
int = [0 15];
h = 0.01;
Lrk = (int(2) - int(1)) / h;

[t, res] = rk4(F, int, F0, Lrk);

mag = res(end, 2);
pos = res(end, 1);

printf("Posición: %.2f\n", pos);
printf("Vel: %.2f\n", mag);
if(sign(mag) == -1)
    printf("Subiendo\n")
elseif(sign(mag) == 1)
    printf("Cayendo\n")
endif

# b)
[maxExt, it] = max(abs(res(:, 1)));

printf("Maxima extensión: %.2f a los %.2f seg\n", maxExt, t(it));

# c)

Lrk = 5000;
int = [0 10];
[t2, res2] = rk4(F, int, F0, Lrk);
a = 1;
b = length(t2);
vals = ceil(linspace(a, b, 11));
[S, dS, ddS] = funcion_spline(t2(vals), res2(vals, 1)', res2(1, 2), res2(end, 2));
[raiz, h] = secante(dS, 7, 9.9, 1000, 1e-6);
printf("La cuerda se encoje hasta: %.3f a los %.3f\n", S(raiz), raiz);

plot(t2, S(t2));
hold on
plot(t, res(:, 1));
legend("Est", "Pos")
line([0 20], [30 30]);
line([raiz raiz], [25 35])
figure
plot(t, res(:, 2))
legend("Vel")
pause