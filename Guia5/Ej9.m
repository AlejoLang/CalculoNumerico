addpath(pwd)

x = [-1, 0, 1, 2];
y = [-1.1, -0.4, -0.9, -2.7];

lny = log(-y);
P = polyfit(x, lny, 2)
xp = linspace(-1.5, 2.5, 200);
yp = polyval(P, xp);
z = -exp(yp);
plot(xp, z)
hold on
for i=[1:length(x)]
    plot(x(i), y(i), 'r-o')
    hold on
endfor
ylim([-5 5])
pause