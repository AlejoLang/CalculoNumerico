addpath(pwd)
addpath("../utils")

L = 1;
h = 3/4;

tita0 = acos(h/L);

F = @(t, z) [z(2);
            -((0.8 * (abs(z(1)) < tita0)) .* z(2)) - sin(z(1))];

F0 = [pi/2; 0];
int = [0 20];

[t, y] = rk4(F, int, F0, 1000);

plot(t, y(:, 1));
pause
