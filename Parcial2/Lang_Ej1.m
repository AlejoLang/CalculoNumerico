addpath(pwd)
addpath("../utils")

function I = trapcomp(x, y)
    n = length(x);
    aux = 0;
    for i = [2:n]
        aux = aux + ((x(i)-x(i-1)) * (y(i) + y(i-1)));
    endfor
    I = aux / 2;
endfunction


# a)

F = @(t, z) [
    z(4);
    z(5);
    z(6);
    z(5).*sin(50.*t);
    -z(4).*sin(50.*t);
    0
];
# [rx, ry, rz, vx, vy, vx]
F0 = [1; 0; 0; 0; 1; 0];
int = [0 2];
h = 0.02;
L = (int(2) - int(1)) / h;

[t, y] = rk4(F, int, F0, L);
[t2, y2] = rk4(F, int, F0, L-1);

printf("Posición en t=2s: (%.6f, %.6f, %.6f)\n", y(end,1), y(end, 2), y(end, 3));
errX = abs(y2(end, 1) - y(end, 1));
errY = abs(y2(end, 2) - y(end, 2));
errZ = abs(y2(end, 3) - y(end, 3));
printf("Error cons en rx: %.10f\n", errX);
printf("Error cons en ry: %.10f\n", errY);
printf("Error cons en rz: %.10f\n", errZ);


# b)

printf("Vector velocidad en t=2: (%.5f, %.5f, %.5f)\n", y(end, 4), y(end, 5), y(end, 6));
printf("Aceleracion x: %.10f\n", y(end,5)*sin(100))
printf("Aceleracion y: %.10f\n", -y(end,4)*sin(100))


# c)

d = sqrt((y(:, 4).^2)+(y(:, 5).^2)+(y(:, 6).^2));
I = trapcomp(t', d');
printf("Integral: %.8f\n", I);