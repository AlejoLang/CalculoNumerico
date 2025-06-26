addpath(pwd)
addpath("../utils")
x = [-1, 1, 2, 3, 4];
y = [0.23, 0.25, 0.26, 0.14, 0.06];

% Ejercicio a) %
A = [exp(x(:)), x', ones(length(x), 1)];
c = A \ (1./y)';
m = c(1); %  b / a
n = c(2); % c / a
o = c(3); % 7.5 / a
a =  7.5 / o;
b = m * a;
c = n * a;

f = @(z) a ./ ((b .* exp(z)) + c .* z + 7.5);

printf("a = %.7f\n", a);
printf("b = %.7f\n", b)
printf("c = %.7f\n", c)


xp = linspace(-1.5, 4, 200);
yp = f(xp);
plot(xp, yp)
hold on
for i = 1:length(x)
    plot(x(i), y(i), 'r-o')
    hold on
endfor

% Ejercicio b) %
[S, dS, ddS] = funcion_spline(x, y);
printf("f(0) ~= S(0) = %.7f\n", S(0));
plot(xp, S(xp))

% Ejercicio c) %
printf("Error relativo splines: %.4f\n", (abs(0.23-S(0))/0.23))
printf("Error relativo min cuadrados: %.4f\n", (abs(0.23-f(0))/0.23))
pause