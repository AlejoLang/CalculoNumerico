addpath(pwd)
addpath("../utils")

x = [1, 2, 3];
y = [1/4, 1/8, 1/12];

c = evLagrange(x, y, linspace(1,1.7,100));

printf("%.6f",abs((1/(4*1.7)) - c(end)))