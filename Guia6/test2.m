addpath(pwd)
addpath("../utils")

f = @(x) sin(x) .* (exp(x) ./ 10) + 0.1 .* x .^ 2;
int02 = 0.8063557675679 ;
x = 0:0.2:2;
y = f(x);
ip = 1:100;
err1 = zeros(1, 100);
err2 = zeros(1, 100);
err1g = zeros(1, 100);
err2g = zeros(1, 100);

for i= 1:50
    I = intNCcompuesta(f, 0, 2, i, 1);
    Q1 = cuad_gauss_c(f, 0, 2, i, 1);
    I2 = intNCcompuesta(f, 0, 2, i, 2);
    Q2 = cuad_gauss_c(f, 0, 2, i, 2);
    err2(i) = abs(I2 - int02);
    err1(i) = abs(I - int02);
    err1g(i) = abs(Q1 - int02);
    err2g(i) = abs(Q2 - int02);

    printf("Integral aproximada con %d puntos: %.14f\n", i, I);
    printf("Integral aproximada con %d puntos (Gauss): %.14f\n", i, Q1);
    printf("Integral aproximada con %d puntos (Simpson): %.14f\n", i, I2);
    printf("Integral aproximada con %d puntos (Gauss Simpson): %.14f\n", i, Q2);
    printf("Error relativo n = 1: %.14f\n", err1(i));
    printf("Error relativo n = 1 (Gauss): %.14f\n", err1g(i));
    printf("Error relativo n = 2: %.14f\n", err2(i));
    printf("Error relativo n = 2 (Gauss): %.14f\n", err2g(i));
    printf("--------------------------------------------------\n");
endfor

plot(ip, err1, 'r-x');
hold on
plot(ip, err2, 'g-o');
hold on
plot(ip, err1g, 'b-+');
hold on
plot(ip, err2g, 'k-*');
legend("intNCcompuesta n=1", "intNCcompuesta n=2", "cuad_gauss_c n=1", "cuad_gauss_c n=2");

pause