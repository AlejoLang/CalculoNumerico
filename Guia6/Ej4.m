addpath(pwd)
addpath("../utils")

f = @(x) sin(pi .* x);
int = @(x) -1/pi * cos(pi .* x);
x = linspace(0, 5, 100);
y = f(x);
plot(x, y);
legend("f(x)");
hold on
int05 = int(5) - int(0);

for i=[2:13]
    aux = intNCcompuesta(f, 0, 5, 1, i);
    % Separar 0 y 5 en i puntos equidistantes%
    auxx = 0:5/(i-1):5;
    auxy = f(auxx);
    auxy = evLagrange(auxx, auxy, x);
    plot(x, auxy, 'r');
    legend(num2str(i));
    hold on
    printf("n = %d, error = %.7f\n", i, abs(aux - int05));
endfor