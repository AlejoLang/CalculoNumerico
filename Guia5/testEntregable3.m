addpath(pwd)
addpath("../utils/")

tx = [0, 2, 4, 6];
x = [2, 1.5, 0.5, 0];
ty = [0, 1, 2, 3, 4, 5, 6];
y = [0, 1, 0, -1, 0, 1, 0];

[Sx, dSx, ddSx] = funcion_spline(tx, x);
[Sy, dSy, ddSy] = funcion_spline(ty, y, pi/2, -pi/2);

tp = linspace(0, 6, 100);
plot(tp, Sx(tp));
hold on
plot(tp, Sy(tp));
legend("x(t)", "y(t)");
figure()
plot(Sx(tp), Sy(tp));

disp("Datos a los 3 segundos")
printf("Pos: (%f.4, %f.4)\n", Sx(3), Sy(3));
printf("Vector velocidad: (%f.4, %f.4)\n", dSx(3), dSy(3));

pause;