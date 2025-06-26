addpath(pwd)
addpath("../utils/")

valMed = 38.78;

A = [16.87,  0.1650,  0.2019,  0.3710,  0.2340,  0.1820,  0.1100;
         0,       0, 22.3500, 13.0500,  4.4200,  6.0010,  3.0430;
         0, 27.7000,  0.8620,  0.0620,  0.0730,  0.1310,  0.1200;
         0,       0,       0, 11.2800,       0,  1.1100,  0.3710;
         0,       0,       0,       0,  9.8500,  1.1684,  2.1080;
         0,       0,       0,       0,  0.2990, 15.9800,  2.1070;
         0,       0,       0,       0,       0,       0,  4.6700];


b = [ 17.1;
      186.0;
      65.1;     
      82.7;
      84.2;
      63.7;
     119.7];


x = gauss_p(A, b);
smx = sum(x);
disp(["Valor medido: ", num2str(valMed)]);
disp(["Valor calculado: ", num2str(smx)]);
disp(["Error absoluto: ", num2str(abs(smx - valMed))]);
disp(["Error relativo: ", num2str((abs(smx - valMed) / abs(valMed)) * 100),  "%"])
