addpath(pwd)

U = 0.5;
v = 5*1e-6;

F = @(n, z) [
    z(2);
    z(3);
    -(1/2) * z(1) * z(3)
];
F0 = [0; 0; 0.332];
int = [0 4.92]
h = 0.01;
L = (int(2) - int(1)) / h;
[n, z] = rk4(F, int, F0, L);
disp([n z])
plot(n, z)
legend("f", "df", "ddf")
line([-0 5], [0.99 0.99])

printf("n99: %.3f\n", n(end));

f = @(x) 4.92 .* sqrt((v.*x)/U);
printf("Valor en x=20 %.4f\n", f(20));

Q = simpsoncomp(n, z(:,2));
q = @(x) sqrt(v .* U .* x) .* Q;
printf("Valor de q(20): %.4f\n", q(20));

pause