addpath(pwd)
addpath("../utils")

l = 2;                          # Largo en cm
A = 0.01;                       # Area transversal en cm^2
c = 0.217;                      # Calor específico cal/g
ro = 2.7;                       # Densidad g/cm^3
K0 = 0.57;                      # Conductividad térmica cal/(s*cm*C)
alpha = 6;                      # Temp extremo izquierdo    
H = 15;                         # Coef enfriamiento Newton
uE = 4;                         # Temp. ext
f = @(x) 2*x.*(2-x);            # Fuente de calor
cR = @(x) (0.1 .* (x.^3)) + 2.5 # Proceso reactivo

F = @(x) [0.*x, (cR(x)./K0), -(f(x)/K0)];

rob = [K0, H, H*uE];
tol = 1e-8;

L = 1000
[x, y] = dif_fin_rob(F, [0 l], alpha, rob, L);
for i = 1:100
    L = L * 2;
    [xi, yi] = dif_fin_rob(F, [0 l], alpha, rob, L);
    if(abs(y(end) - yi(end)) <= tol)
        x = xi;
        y = yi;
        break;
    endif
    x = xi;
    y = yi;
endfor

printf("Temp en extremo derecho: %.10f\n", y(end));
df = (y(end) - y(end-1)) / (x(end) - x(end-1));
phi = -K0 * df;
printf("Flujo en extremo derecho: %.10f\n", phi);

func = c.*ro.*(y');
E = A * simpsoncomp(x, func);
printf("Energía: %.10f\n", E)
