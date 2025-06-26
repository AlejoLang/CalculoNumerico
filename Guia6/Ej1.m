addpath(pwd)
addpath("../utils")

f = @(x) exp(x)-2.*x.^2+3.*x-1;
df = @(x) exp(x) -4*x + 3;
x = linspace(-0.2,0.2,100);
h = linspace(1e-11, 1e-1, 100);

hold on
df1 = dospuntos(f, 0, h);
df2 = trespuntos(f, 0, h);
df3 = cincopuntos(f, 0, h);
df4 = extrapRichardson2(f, 0, h);
dx = df(0);
err1 = (abs(df1 - dx) ./ abs(dx));
err2 = (abs(df2 - dx) ./ abs(dx));
err3 = abs(df3 - dx) ./ abs(dx);
err4 = abs(df4 - dx) ./ abs(dx);

plot(h, err1, 'r-x');
plot(h, err2, 'g-o');
plot(h, err3, 'b-+');
plot(h, err4, 'k-*');

printf("Error relativo con dos puntos: %.8f\n", err1(end));
printf("Error relativo con tres puntos: %.8f\n", err2(end));
printf("Error relativo con cinco puntos: %.8f\n", err3(end));
printf("Error relativo con extrapolacion de Richardson: %.8f\n", err4(end));

legend("dospuntos", "trespuntos", "cincopuntos", "extrapRichardson2");
pause