addpath(pwd)
addpath("../utils")

F = @(t, z) [
    z(2);
    z(3);
    -4*z(3)-5*z(2)-2*z(1)-4.*sin(t)-2.*cos(t)
];
F0 = [1; 0; -1];
int = [0 5];
h = 0.0001;
L = (int(2) - int(1)) / h;

[x, y] = rk4(F, int, F0, L);

for i = 2:length(x)
    if(y(i-1)*y(i) < 0)
        printf("%.3f\n",x(i));
    endif
endfor

plot(x, y(:, 1));
pause