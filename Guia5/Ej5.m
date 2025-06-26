addpath(pwd)
addpath("../utils/")

f = @(x) sin(pi .* 2 .* x);

x = linspace(-1, 1, 21);
x2 = linspace(-1, 1, 100);
y = f(x);
y2 = polyval(PolyLag(x, y), x2);
[a, b, c, d] = cubic_spline_natural(x, y);
y3 = eval_spline(x2, x, a, b, c, d);
plot(x, y, 'color', 'r', x2, y2, 'color', 'b', x2, y3, 'color', 'g')
legend("norm", "larg", "spline")
figure()

function y = createF(x)
    n=length(x);
    for i=[1:n]
        y(i) = sin(pi * 2 * x(i)) + (-1)^(i+1) * 1e-4;
    endfor
endfunction

y4 = createF(x);
y5 = polyval(PolyLag(x, y4), x2);
[a, b, c,d ]= cubic_spline_natural(x, y4);
y6 = eval_spline(x2,x,a,b,c,d);
plot(x, y4)
hold on
plot(x2, y5)
hold on
plot(x2, y6)
legend("norm", "larg", "spline")

pause