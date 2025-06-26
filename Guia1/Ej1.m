addpath(pwd)

function y = g1(x)
  p = [1];  % P(x) = 1
  y = polyval(p, x);
end

function y = g2(x)
  p = [-1/factorial(2), 0, 1];  % P(x) = 1 - x^2/2!
  y = polyval(p, x);
end

function y = g3(x)
  p = [1/factorial(4), 0, -1/factorial(2), 0, 1];  % P(x) = 1 - x^2/2! + x^4/4!
  y = polyval(p, x);
end

function y = g4(x)
  p = [-1/factorial(6), 0, 1/factorial(4), 0, -1/factorial(2), 0, 1];
  % P(x) = 1 - x^2/2! + x^4/4! - x^6/6!
  y = polyval(p, x);
end
x = linspace(-pi, pi, 200);
y = cos(x);
y1 = g1(x);
y2 = g2(x);
y3 = g3(x);
y4 = g4(x);


figure()
axis([-pi pi -1.5 1.5]);
plot(x, y)
hold on
plot(x, y1)
figure()
axis([-pi pi -1.5 1.5]);
plot(x, y)
hold on
plot(x, y2)
figure()
axis([-pi pi -1.5 1.5]);
plot(x, y)
hold on
plot(x, y3)
figure()
axis([-pi pi -1.5 1.5]);
plot(x, y)
hold on
plot(x, y4)
pause

