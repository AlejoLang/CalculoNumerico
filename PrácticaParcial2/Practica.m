addpath(pwd)
addpath("../utils")

m = 10;
g = [0, -9.81];
c = 0.2;
h = 30;

F = @(t,z) [
    z(3);
    z(4); 
    g(1)-(c/m).*z(3);
    g(2)-(c/m).*z(3)
];

F0 = [0, 30, 40, 0]';

int = [0 3];
h = 0.001;
L = (int(2)-int(1)) / h;
[t, yrk4] = rk4(F, int, F0, L);
disp(yrk4)
plot(t, yrk4(:,2))

P = polyfit(t', yrk4(:,2), 2);
p =@(t) P(1) .* (t.^2) + P(2) .* t + P(3);

[x, h] = secante(p, 2, 2.5, 1000, 1e-8);
printf("Toca el suelo en t = %.8f", x);
printf("f(t): %.8f\n", p(x))
line([0 3], [0 0]);
line([x x], [-1 1])

pause
