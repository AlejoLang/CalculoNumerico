addpath(pwd)
addpath("../utils/")
f = @(x) log(x.^2 + 1)-exp(x./2).*cos(pi .* x)- 1.106;
contRaices = 0;
df = 0.01;
x = linspace(-8, 8, 1000);
y = f(x);
plot(x, y)
line([-8, 8], [0, 0], "color", "black")
ylim([-50, 50])
xlim([-8, 8])

for i = [-6:df:6]
    if(f(i) * f(i + df) < 0)
        contRaices = contRaices + 1;
    endif
endfor
disp(["Cantidad de raices: ", num2str(contRaices)]);
disp("-------------------")

i = -1;
a = i;
b = i;
maxit = 10000;
tol = 1e-7;
while (f(a) * f(b) >= 0)
    if(abs(i-a) <= abs(i-b))
        b += 1;
    else
        a -= 1;
    endif
endwhile
[xb, hb] = biseccion(f, a, b, maxit, tol);
disp(["Intervalo [", num2str(a), ", ", num2str(b), "]"]);
printf("x = %.7f\n", xb);
disp(["Numero iteraciones: ", num2str(length(hb))]);
line([xb, xb], [-2, 2])
disp("-------------------")

df =@(x) ((2 .* x) ./ (x.^2 + 1)) - (0.5 .* exp(x./2) .* cos(pi.*x)) + (exp(x./2) .* sin(pi .* x) .* pi);
tol = 1e-10;

[xn1, hn1] = newton(f, df, 3, maxit, tol);
[xn2, hn2] = newton(f, df, 3.05, maxit, tol);
[xn3, hn3] = newton(f, df, 3.1, maxit, tol);

disp("Newton con x0=3");
printf("x = %.10f\n", xn1);
disp(["it = ", num2str(length(hn1))]);

disp("Newton con x0=3.05");
printf("x = %.10f\n", xn2);
disp(["it = ", num2str(length(hn2))]);

disp("Newton con x0=3.1");
printf("x = %.10f\n", xn3);
disp(["it = ", num2str(length(hn3))]);
disp("--------------")
line([xn1, xn1], [-5, 5], "color", "r")
line([xn2, xn2], [-5, 5], "color", "r")
line([xn3, xn3], [-5, 5], "color", "r")

g = @(x) f(x) - x;
tol = 1e-7;
[xs, hs] = secante(g, 0, 1, maxit, tol);
disp("Punto fijo mas cercano a x=1");
printf("x = %.7f\n", xs);
printf("f(%.7f)= %.7f\n",xs, f(xs))

legend("f", "y=0", "xb", "xn1", "xn2", "xn3")
pause