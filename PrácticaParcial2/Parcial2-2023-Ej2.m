addpath(pwd)
addpath("../utils")

P = 3000;
L = 120;
E = 2.1e6;
I = 4250;
int = [0 L];
h = 0.001;
LA = (int(2) - int(1)) / h;
M = @(x) P .* (L - x);

F = @(x, z) [ 
    z(2);
    (M(x)./(E * I)).*((1+(z(2).^2)).^(3/2))
];
F0 = [0; 0];

[x, y] = rk4(F, int, F0, LA);

[mx, pos] = max(y(:,1))
printf("Max %.4f en x=%.4f\n", mx, x(pos));

for i=1:length(y(:,2))
    if(y(i, 2) >= 0.0019)
        printf("Pendiente mayor a 0.0019 a partir de x=%.4f\n", x(i))
        break
    endif

endfor
