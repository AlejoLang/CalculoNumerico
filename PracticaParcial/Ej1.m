addpath(pwd)
addpath("../utils")
g = 9.8;
c = 15;
t = 5;
v = 35;
m = 110;

f = @(mx) (g .* mx .* (1- exp(-((c./mx).*t)))) - (c * v)
g = @(cx) (g .* m .* (1- exp(-((cx./m).*t)))) - (cx * v)
[xsf, hsf] = secante(f, 0, 200, 1000, 1e-5);
[xsg, hsg] = secante(g, 50, 200, 1000, 1e-5);
disp(xsf)
disp(xsg)
x = linspace(-200, 200, 1000);
yf = f(x);
yg = g(x);
plot(x, yf, 'color', 'k',x, yg, 'color', 'k')
line([0 200], [0 0], 'color', 'k')
line([xsf xsf], [-100 100], 'color', 'b')
line([xsg xsg], [-100 100], 'color', 'r')
xlim([-200 200])
ylim([-100 100])
pause;