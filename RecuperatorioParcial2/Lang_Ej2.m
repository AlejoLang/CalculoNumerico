addpath(pwd)

function I = trapcomp(x, y)
    n = length(x);
    aux = 0;
    for i = [2:n]
        aux = aux + ((x(i)-x(i-1)) * (y(i) + y(i-1)));
    endfor
    I = aux / 2;
endfunction

m = 68.1;
cd = 0.25;
g = 9.81;

v = @(t) sqrt((g*m)/cd).*tanh(sqrt((g*cd)/m).*t);

x = linspace(0, 10, 100);
I = trapcomp(x, v(x));
printf("I: %.3f\n", I);

I2 = intNCcompuesta(v, 0, 5, 5, 1);
I2_prev = intNCcompuesta(v, 0, 5, 4, 1);
I3 = cuad_gauss_c(v, 0, 5, 5, 2);
I3_prev = cuad_gauss_c(v, 0, 5, 4, 2);

printf("I2: %.10f\n", I2);
printf("I2 prev: %.10f\n", I2_prev);
printf("I3: %.10f\n", I3);
printf("I3 prev: %.10f\n", I3_prev);
