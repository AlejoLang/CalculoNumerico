addpath(pwd)
addpath("../utils")

function x = rcubica(a)
    f = @(x) x.^3 - a;
    if(a > 0)
        xmin = 0;
        xmax = a;
    else
        xmin = a;
        xmax = 0;
    endif
    maxit = ceil(log2((xmax-xmin)/1e-12))
    [x, h] = biseccion(f, xmin, xmax, maxit, 1e-12);
    disp(h(1, end))
endfunction

printf("%.10f\n", rcubica(188968768723124))
