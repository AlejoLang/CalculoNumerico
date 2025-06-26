addpath(pwd)
addpath("../utils")

df = @(t, y) -y + sin(t) + cos(t);
y0 = 0;
est = 2;
h = [1/10, 1/20, 1/40, 1/80, 1/160, 1/320];
int = [y0, est];
valR = sin(2);
printf("Valor real y(2) %.16f", valR)
for i = [1: length(h)]
    L = (est - y0) / h(i);
    [te, ye] = euler(df, int, y0, L);
    [trk2, yrk2] = rk2(df, int, y0, L);
    [trk4, yrk4] = rk4(df, int, y0, L);
    printf("----------------------\n");
    printf("L: %i\n", L);
    printf("Euler y(2): %.16f\n", ye(end));
    printf("RK2 y(2): %.16f\n", yrk2(end));
    printf("RK4 y(2): %.16f\n", yrk4(end));
    printf("Error euler: %.16f\n", abs(ye(end) - valR));
    printf("Error RK2: %.16f\n", abs(yrk2(end) - valR));
    printf("Error RK4: %.16f\n", abs(yrk4(end) - valR));
    plot(te, ye);
    hold on
endfor

ant = 0;
[taux, yaux] = euler(df, int, y0, 640);
ant = yaux(end);
Lmin = 0;
for i = [641: 5000]
    [te, ye] = euler(df, int, y0, i);
    err = abs(ye(end) - valR);
    if(err < 1e-6) 
        Lmin = i;
        break;
    endif
    ant = ye(end);
endfor

printf("Min L para 1e-3 en euler %i\n", Lmin)
printf("Val %.16f\n", ant)

x = linspace(0, 2, 100);
y = sin(x);
plot(x, y)
pause
