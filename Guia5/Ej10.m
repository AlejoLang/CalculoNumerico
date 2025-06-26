addpath(pwd)

t = [4, 8, 12, 16 , 20, 24];
c = [1590, 1320, 1000, 900, 650, 560];

lnc = log(c)
P = polyfit(t, lnc, 1)

m = P(1);
b = exp(P(2));

x = linspace(0, 24, 1000);
y = b .* exp(m .* x);
plot(x, y);
hold on
for i=1:length(t)
    plot(t(i), c(i), 'r-o')
    hold on
endfor

y(1)
-(log(220/b)/m)

pause