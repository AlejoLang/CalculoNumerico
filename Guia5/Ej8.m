addpath(pwd)

s = [0, 1, 2, 3, 4, 5, 6];
c = [432, 599, 1012, 1909, 2977, 4190, 5961];

P6 = polyfit(s, c, 6);
P1 = polyfit(s, c, 1);
P2 = polyfit(s, c, 2);
x = linspace(-1, 7, 300);
y6 = polyval(P6, x);
y1 = polyval(P1, x);
y2 = polyval(P2, x)
plot(x, y6);
hold on
plot(x, y1)
hold on
plot(x, y2)
hold on
for i = 1:length(s)
    plot(s(i), c(i), 'o-r')
endfor



err6 = min(sum(abs(c - polyval(P6, s))))
err1 = min(sum(abs(c - polyval(P1, s))))
err2 = min(sum(abs(c - polyval(P2, s))))

P6_10 = polyval(P6, 10)
P1_10 = polyval(P1, 10)
P2_10 = polyval(P2, 10)
errP6_10 = abs(14900 - P6_10)
errP1_10 = abs(14900 - P1_10)
errP2_10 = abs(14900 - P2_10)

pause
