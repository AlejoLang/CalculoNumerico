addpath(pwd)
addpath("../utils")

ddy = @(x) [(-2 ./ x) , (2 ./ (x .^ 2)) , (sin(log(x)) ./ (x .^ 2))];

int = [1 2];
yc = [1 2];
h = 0.001;
L = (int(2) - int(1))/h;

[x, y] = disparo_lineal(ddy, int, yc, L);
[x2, y2] = dif_fin_dir(ddy, int, yc, L);
plot(x, y(:,1));

c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)));
c1 = (11/10) - c2;
yreal = @(x) c1 .* x + (c2 ./ (x.^2)) - (3/10) .* sin(log(x)) - (1/10) .* cos(log(x));
xp = linspace(1, 2, 100);
yr = yreal(xp);
hold on
plot(xp, yr);

maxErr = 0;
for i = 1:length(x)
    valEst = y(i);
    valR = yreal(x(i));
    err = abs(valEst - valR);
    if(err > maxErr) maxErr = err; endif
endfor
printf("Max err: %.16f\n", maxErr)

maxErr = 0;
for i = 1:length(x2)
    valEst = y2(i);
    valR = yreal(x2(i));
    err = abs(valEst - valR);
    if(err > maxErr) maxErr = err; endif
endfor
printf("Max err2: %.16f\n", maxErr)

pause;