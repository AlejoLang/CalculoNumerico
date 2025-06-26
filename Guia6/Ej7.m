addpath(pwd)
addpath("../utils")

x = [0, 200, 400, 600, 800, 1000, 1200];
ro = [4, 3.95, 3.89, 3.8, 3.6, 3.41, 3.3];
Ac = [100, 103, 106, 110, 120, 133, 149.6];
y = ro .* Ac;
w = pesosNC(7);

I = 1200 * (y * w);
I2 = simpsoncomp(x, y);
I3 = trapcomp(x, y);
printf("Integral aproximada con Newton-Cotes: %.4f\n", I);
printf("Integral aproximada con Simpson: %.4f\n", I2);
printf("Integral aproximada con trapecios: %.4f\n", I3);