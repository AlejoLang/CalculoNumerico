addpath(pwd)
addpath("../utils")

f = @(x) sin(x) .* (exp(x) ./ 10);
x = [0, 0.1, 0.3, 0.34, 0.5, 1, 1.3, 1.6, 1.98, 2.1, 2.5, 3, 3.5, 4, 4.5, 4.75, 5];
y = f(x);


I = trapcomp(x, y);
I2 = simpsoncomp(x, y);
printf("Integral aproximada con trapecios: %.4f\n", I);
printf("Integral aproximada con Simpson: %.4f\n", I2);