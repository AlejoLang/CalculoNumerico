addpath(pwd)
addpath("../utils")
f = @(x) sin(x) + cos(1 + x.^2) - 1;
df = @(x) cos(x) - 2*x.*sin(1 + x.^2);
N = 1000;
kmax = 100000;
tol = 1e-10;
raices_b = [];
raices_n = [];
raices_s = [];
it_b = [];
it_n = [];
it_s = [];
x = linspace(1.5, 3, N);
xx = linspace(0, 5, N);
y = f(x);
plot(x, y, "r")
line("xdata", [1.5, 3], "ydata", [0, 0], "lineWidth", 1)

for i = [1:length(xx)-1]
    x0 = xx(i);
    x1 = xx(i+1);
    if (f(x0) * f(x1) < 0)
        [xb, hb] = biseccion(f, x0, x1, kmax, tol);
        [xn, hn] = newton(f, df, x0, kmax, tol);
        [xs, hs] = secante(f, x0, x1, kmax, tol);
        disp("Bisección")
        disp(length(hb))
        disp(xb)
        disp(hb(end))
        disp("Newton")
        disp(length(hn))
        disp(xn)
        disp(hn(end))
        disp("Secante")
        disp(length(hs))
        disp(xs)
        disp(hs(end))
        line("xdata", [xb, xb], "ydata", [-0.7, 0.7], "lineWidth", 1, "color", "b")
        line("xdata", [xn, xn], "ydata", [-0.5, 0.5], "lineWidth", 1, "color", "g")
        line("xdata", [xs, xs], "ydata", [-0.2, 0.2], "lineWidth", 1, "color", "m")
    endif
endfor
legend("f(x)", "0", "Raiz Bisección", "Raiz Newton", "Raiz Secante")
xlim([1.5, 3])

pause