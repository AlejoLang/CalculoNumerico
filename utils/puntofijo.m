function [x, h] = puntofijo(g, x0, kmax, tol)
    h = [];
    for i = [1:kmax]
        x = g(x0);
        h = [h abs(x - x0)];
        if(h(1, i) < tol) return endif
        x0 = x;
    endfor
endfunction