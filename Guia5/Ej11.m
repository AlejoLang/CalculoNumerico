addpath(pwd)

deltaT = 0.2;
v = load('../datos_velocidades.txt')';#'
t = 0:deltaT:(length(v) - 1)*deltaT;
x = linspace(-0.5, 5.5, 400);

A = [sin(2*t(:)), t(:).^2, 2.^t(:), ones(length(t),1)]
c = A \ v';#'
v_f =  @(z) c(1) .* sin(2.*z) + c(2) .* z.^2 + c(3) .* 2.^z + c(4);
v_f(6)

P = polyfit(t, v, 6);
v_p = @(z) polyval(P, z);
v_p(6)

plot(t, v, 'ro');
hold on
plot(x, v_f(x));
hold on
plot(x, v_p(x));

err_f = min(sum(abs(v_f(t) - v) .^ 2))
err_p = min(sum(abs(v_p(t) - v) .^ 2))

dist = quad(v_f, 0, 6)
dist = quad(v_p, 0, 6)

pause