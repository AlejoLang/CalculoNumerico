addpath(pwd)
addpath("../utils")

temps = load("./datos1.txt");
meses = [1:12]';

M = [meses, ones(length(meses), 1), sin((pi/6) .* meses), cos((pi/6) .* meses)];

coef = M \ temps;
a = coef(1);
b = coef(2);
c = coef(3);
d = coef(4);

printf("a = %.4f\n", a);
printf("b = %.4f\n", b);
printf("c = %.4f\n", c);
printf("d = %.4f\n", d);

f = @(x) a .* x + b + c .* sin((pi/6) .* x) + d .* cos((pi/6) .* x);
x = linspace(1,12,300);
y = f(x);

err = norm((f(meses) - temps), 2);
printf("Err max abs: %4f\n", err);

tempEn2020 = f(13);
tempEnReal2020 = 27;
printf("Temp medio en enero: %.1f\n", tempEn2020);
printf("Error relativo: %.4f\n", abs(tempEn2020-tempEnReal2020) / tempEnReal2020);

plot(meses, temps, 'rx');
hold on
plot(x, y, 'b-')
pause