addpath(pwd)
addpath("../utils/")

x = [0, 1 ,2];

f = [ 1, 2, -1];

[a,b,c,d] = cubic_spline_natural(x, f)