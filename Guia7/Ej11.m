addpath(pwd)
addpath("../utils")

yreal = @(t) (7/4) .* t + (1/2) .* (t.^3) .* log(t) - (3/4) .* (t.^ 3);
F = @(t, z) [z(2);
                t*log(t) + (2/t)*z(2) - (2/t^2)*z(1)];
F = @(t, z) [z(2);
             (t.^3 .* log(t) + 2*t.*z(2) - 2*z(1)) ./ (t.^2)];
F0 = [1; 0];
inter = [1 2];
h = 0.05;
L = (inter(2) - inter(1)) / h;

[t, yRK4] = rk4(F, inter, F0, L);
yAB = yRK4;
yAM = yRK4;

% Usar RK4 para los primeros 4 valores (índices 1 a 4)
% Luego aplicar AB4 y AM4 desde i = 4 hasta L
for i = 4:L
    f1 = F(t(i), yAB(i,:)')';
    f2 = F(t(i-1), yAB(i-1,:)')';
    f3 = F(t(i-2), yAB(i-2,:)')';
    f4 = F(t(i-3), yAB(i-3,:)')';
    % Predictor AB4
    yAB(i+1,:) = yAB(i,:) + (h/24)*(55*f1 - 59*f2 + 37*f3 - 9*f4);
    % Corrector AM4
    f0 = F(t(i+1), yAB(i+1,:)')';
    yAM(i+1,:) = yAB(i,:) + (h/24)*(9*f0 + 19*f1 - 5*f2 + f3);
end

[tTest, yTest] = adams_rashford(F, inter, F0, L);

% Calcular errores máximos
errMaxRK4 = 0;
errMaxAB = 0;
errMaxAM = 0;
errMaxTEst = 0;

for i = 1:length(t)
    re = yreal(t(i));
    estRK4 = yRK4(i,1);
    estAB = yAB(i,1);
    estAM = yAM(i,1);
    estTest = yTest(i,1);
    if(abs(re - estRK4) > errMaxRK4) errMaxRK4 = abs(re-estRK4); endif
    if(abs(re - estAB) > errMaxAB) errMaxAB = abs(re-estAB); endif
    if(abs(re - estAM) > errMaxAM) errMaxAM = abs(re-estAM); endif
    if(abs(re - estTest) > errMaxTEst) errMaxTEst = abs(re-estTest); endif
endfor

printf("Error max RK4: %.16f\n", errMaxRK4);
printf("Error max AB: %.16f\n", errMaxAB);
printf("Error max AM: %.16f\n", errMaxAM);
printf("Error max Test: %.16f\n", errMaxTEst);
plot(t, yreal(t));
hold on
plot(t, yRK4(:,1));
hold on
plot(t, yAB(:,1));
hold on
plot(t, yAM(:,1));
pause
