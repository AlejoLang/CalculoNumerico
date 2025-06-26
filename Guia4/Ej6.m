addpath(pwd)
addpath("../utils/")
p = 3e7;
a = 0.401;
b = 42.7e-6;
N = 1000
T = 300;
k = 1.38064852e-23;

f = @(x) ((p + a.*((N ./ x).^2)) .* (x - N*b)) - (k * N * T);
f2 = @(x) p .* x + a .* (N^2./x)- (a*b) .*(N^3 ./ x.^2) - p*N*b - k*N*T;
df = @(x) (-2*a.*(N./ (x.^2)) .* (x - N * b))+p+(a.*(N ./x ).^2);
x = linspace(0, 1, N);
y = f(x);
dy = df(x);
plot(x, y, "r","lineWidth", 1, "color", "b")
[xn, hn] = newton(f, df, 0.1, 1000, 1e-12);
line("xdata", [xn, xn], "ydata", [-5e9, 1], "lineWidth", 1, "color", "r")
line("xdata", [0, 5], "ydata", [0, 0], "lineWidth", 1)
disp(["Newton: ", num2str(xn), " it: ", num2str(length(hn))])
xlim([0.005, 0.2])
ylim([-5e7 5e7])
pause;