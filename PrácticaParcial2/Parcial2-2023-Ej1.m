addpath(pwd)
addpath("../utils")

x = [0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0];
y = [4.24, 4.44, 4.91, 5.44, 5.65, 5.33, 3.91, 1.86, 0.07, -1.16, -1.94];

M = [ones(length(x), 1), (cos((pi .* x(:)) ./ 2)), (cos((pi .* x(:)) ./ 2) .^ 2)];

a = M \ y';
printf("a0:, %.2f\n", a(1))
printf("a1:, %.2f\n", a(2))
printf("a2:, %.2f\n", a(3))

f = @(x) a(1) + a(2) .* cos((pi .* x) ./ 2) + a(3) .* (cos((pi .* x) ./ 2) .^ 2);

err = abs(f(1) - y(6));
printf("Error en x = 1: %.4f\n", err)

xp = linspace(0, 2, 100);
yp = f(xp);
plot(x, y, 'rx');
hold on
plot(xp, yp)
pause