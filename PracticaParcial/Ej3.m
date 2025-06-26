addpath(pwd)
addpath("../utils")

val = [230, 18, 9, -221, -9];
dval = [920, 54, 18, -221];
f = @(x) polyval(val, x) - x;
df = @(x) polyval(dval, x) - 1;

x = linspace(-2, 2, 1000);
y = f(x);
dy = df(x);
#plot(x, y, 'r', x, dy, 'b');
ylim([-10, 10]);
[xn, hn] = newton(f, df, 0, 1000, 1e-6);
disp("Newton: ")
disp(xn);
disp(polyval(val, xn));

[xn, hn] = newton(f, df, 1, 1000, 1e-6);
disp("Newton: ")
disp(xn);
disp(polyval(val, xn));
