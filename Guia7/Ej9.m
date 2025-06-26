addpath(pwd)
addpath("../utils")

% Define F with explicit vector operations
F = @(t, x) [x(2);
             x(3);
             -4*sin(t) - 2*cos(t) - 4*x(3) - 5*x(2) - 2*x(1)];

F0 = [1; 0; -1];
int = [0 2.5];
h = 0.001;
L = (int(2) - int(1)) / h;

[t, y] = rk4(F, int, F0, L);
printf("%.8f\n", y(end, 1));

int2 = [0 15];
L = (int2(2) - int2(1)) / h;
[t, y] = rk4(F, int2, F0, L);

count = 0;
for i = [1:length(t)-1]
    a = y(i, 2);
    b = y(i+1, 2);
    if(a * b <= 0) count = count + 1; endif
endfor
printf("%i\n", count);

plot(t, y(:,1));
hold on 
plot(t, y(:, 2))
pause;