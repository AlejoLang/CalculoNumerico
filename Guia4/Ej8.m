addpath(pwd)
addpath("../utils/")

f = @(t) ((t + 1/3).^3 + 1/3).* exp(-t);
df = @(t) 3 * (t + 1/3).^2 .* exp(-t) - ((t + 1/3).^3 + 1/3) .* exp(-t);
ddf = @(t) 3 * (t + 1/3).^2 .* exp(-t) - 6 * (t + 1/3) .* exp(-t) + ((t + 1/3).^3 + 1/3) .* exp(-t);
g = @(t) f(t) -1.5;
a = 1;
b = 2;

while true
    if(g(a) * g(b) < 0)
        break
    else
        b = b * 2;
    endif
endwhile

kmax = 100000;
tol1 = 1e2;
tol2 = 1e-5;
[xb, hb] = biseccion(g, a, b, kmax, tol1);
[xn, hn] = newton(g, df, xb, kmax, tol1);
disp("f(x) = 1.5")
disp(["x: ", num2str(xb), " it: ", num2str(length(hb))])
disp(["x: ", num2str(xn), " it: ", num2str(length(hn))])

while true
    if(df(a) * df(b) < 0)
        break
    else
        b = b * 2;
    endif
endwhile

kmax = 100000;
tol1 = 1e2;
tol2 = 1e-5;
disp("f'(x) = 0")
[xb, hb] = biseccion(df, a, b, kmax, tol1);
[xn, hn] = newton(df, ddf, xb, kmax, tol1);
disp(["x: ", num2str(xb), " it: ", num2str(length(hb))])    
disp(["x: ", num2str(xn), " it: ", num2str(length(hn))])
