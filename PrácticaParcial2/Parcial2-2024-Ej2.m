addpath(pwd)
addpath("../utils")

l = 12;
m1 = 3;
m2= 1;
k = 5;
g = 9.81;

F = @(t, z) [
    z(2);
    -(g/l).*z(1)-(k/m1).*(z(1)-z(3));
    z(4);
    -(g/l)*z(3)+(k/m2)*(z(1)-z(3))
];
F0 = [0.75; 0; 0.25; 0];
int = [0 10];
h = 0.001;
L = (int(2) - int(1)) / h;

[t, y] = rk4(F, int, F0, L);

printf("Pos de x1 a los 10 seg: %.6f\n", y(end, 1));
if(y(end, 2) > 0)
    printf("x1 se mueve hacia la derecha\n");
elseif (y(end, 2) < 0)
    printf("x1 se mueve hacia la izquierda\n");
endif 
printf("Pos de x2 a los 10 seg: %.6f\n", y(end, 3));
if(y(end, 4) > 0)
    printf("x2 se mueve hacia la derecha\n");
elseif (y(end, 4) < 0)
    printf("x2 se mueve hacia la izquierda\n");
endif 