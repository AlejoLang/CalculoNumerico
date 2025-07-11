addpath(pwd)

l0 = 10;
l1 = 1;
w = 1;
phi = 0.02;
g = 9.81;

l = @(t) l0 + l1.*cos(w.*t + phi); 
dl = @(t) -l1.*w.*sin(w.*t + phi);

F = @(t) [-2.*(dl(t)./l(t)), -g./l(t), 0.*t];
a = 0.5;
b = 0;
int = [0 5];

tol = 1e-6;
L = 1000;
[x, y] = dif_fin_dir(F, int, [a b], L);
for i=1:10
    L = L *2;
    [xi, yi] = dif_fin_dir(F, int, [a b], L);
    if(abs(yi(end-1)-y(end-1)) < tol)
        x = xi;
        y = yi;
        break;
    endif
    x = xi;
    y = yi;
endfor
disp(L)
df = (y(2)-y(1))/(x(2)-x(1));
printf("Velocidad inicial: %.6f\n", df);

[my, idx] = max(abs(y));
printf("Maxima amplitud: %.6f a los %.6f segundos\n", my, x(idx));

[mx, idx] = min(abs(x - 2.5));
printf("Amplitud a los 2.5s: %.6f\n", y(idx));

plot(x, y)
pause

