addpath(pwd)

# a)

x1 = @(t) 6.*cos(t) - 3.*cos(2.*t);
dx1 = @(t) 6.*sin(t) - 6.*sin(2.*t);
x2 = @(t) 6.*sin(t) - 3.*sin(2.*t);
dx2 = @(t) -6.*cos(t) + 6.*cos(2.*t);
t = linspace(0, 2*pi, 8);
tp = linspace(0, 2*pi, 100);
y1 = x1(t);
y2 = x2(t);

[S1, dS1, ddS1] = funcion_spline(t, y1, dx1(0), dx1(2*pi));
[S2, dS2, ddS2] = funcion_spline(t, y2, dx2(0), dx2(2*pi));

mag = sqrt(dS1(4)^2 + dS2(4)^2);
printf("Magnitud de la velocidad a los 4 segundos: %.6f\n", mag);


# b)

magR = sqrt(dx1(4)^2 + dx2(4)^2);
printf("Error cometido: %.6f\n", abs(magR - mag));

plot(tp, x1(tp));
hold on
plot(tp, S1(tp));
legend("x1 real", "x2 traz");
figure
plot(tp, x2(tp));
hold on
plot(tp, S2(tp));
legend("x2 real", "x2 traz");
pause