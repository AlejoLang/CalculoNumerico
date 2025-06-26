addpath(pwd)
addpath("../utils")

t = [0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8];
int = [3.16, 2.38, 1.75, 1.34, 1.00, 0.74, 0.56];

li = log(int);
P = polyfit(t, li, 1);
b = exp(P(2));
a = -P(1);

printf("I0: %.4f\n", b);
printf("a: %.4f\n", a);

f = @(x) b.*exp(-a.*x);
x = linspace(0, 1, 100);
y = f(x);

plot(x, y);
hold on
plot(t, int, 'rx');
pause
