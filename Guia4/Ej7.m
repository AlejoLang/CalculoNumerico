addpath(pwd)
addpath("../utils/")
f = @(x) (x .* (log(x + 3) - 17)) -1;
df = @(x) (log(x + 3) - 17) + (x ./ (x + 3));
a = 0;
b = 1;
while true
    if(f(a) * f(b) < 0)
        break
    else
        b = b * 2;
    endif
endwhile

kmax = 100000;
tol1 = 1e2;
tol2 = 1e-12;

tic()
[xb, hb] = biseccion(f, a, b, kmax, tol1);
t1 = toc();
tic()
[xn, hn] = newton(f, df, xb, kmax, tol1);
t2 = toc();
disp(["Bisección: ", num2str(xb)," it: ", num2str(length(hb)) ," ", num2str(t1)])
disp(["Newton: ", num2str(xn), " it: ", num2str(length(hn)), " ", num2str(t2)])