addpath(pwd)
addpath("../utils/")

t1 = [0, 1, 2]
t2 = [2, 3, 4];
x1 = [0, 2, 6];
y1 = [0, 4, 6];
x2 = [6, 3, 0];
y2 = [6, 2, 0];
dx = [0, 0];
dy = [0, 0];

[Sx1, dSx1, ddSx1] = funcion_spline(t1, x1, dx(1), dx(2));
[Sy1, dSy1, ddSy1] = funcion_spline(t1, y1, dy(1), dy(2)); 
[Sx2, dSx2, ddSx2] = funcion_spline(t2, x2, dx(1), dx(2));
[Sy2, dSy2, ddSy2] = funcion_spline(t2, y2, dy(1), dy(2)); 

tp1 = linspace(0, 2, 100);
tp2 = linspace(2, 4, 100);
xt1 = Sx1(tp1);
yt1 = Sy1(tp1);
xt2 = Sx2(tp2);
yt2 = Sy2(tp2);

xtot = [xt1 xt2];
ytot = [yt1 yt2];
ttot = [tp1 tp2];

disp(Sx1(1.2))
disp(Sy1(1.2));
disp(Sx2(3.1));
disp(Sy2(3.1))

plot(ttot, xtot);
hold on;
plot(ttot, ytot)
figure()
plot(xtot, ytot)
pause