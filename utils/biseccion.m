function [x, h] = biseccion(f, xmin, xmax, kmax, tol)
    a = xmin;
    b = xmax;
    prev = -0;
    h = []; 
    x = 0;
    for i = [1:kmax]
        x = a + ((b - a) / 2);
        h = [h abs(x-prev)]; 
        if(h(1, i) < tol) return endif
        if(f(x) > 0)
            a = x;
            prev = x;
        else
            b = x;
            prev = x;
        endif
    endfor
endfunction