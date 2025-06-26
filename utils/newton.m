function [x, h] = newton(f, df, x0, kmax, tol)
    h = [];
    for i = [1 : kmax]
        x = x0 - (f(x0) / df(x0));
        h = [h abs(x - x0)];
        if(h(end) < tol) return endif
        x0 = x;
    endfor
endfunction