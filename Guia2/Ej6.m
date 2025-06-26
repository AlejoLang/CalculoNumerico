addpath(pwd)
addpath("../utils")

M = [ 80, -50,  30,   0;
     -50, 100, -10, -25;
     -30, -10,  65, -20;
       0, -25, -20, 100];

b = [120;
       0;
       0;
       0];

x = gauss_p(M, b);
y = gauss1(M, b);
A = doolittle(M);
display(y);

display(x);