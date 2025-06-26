function I = trapcomp(x, y)
    n = length(x);
    aux = 0;
    for i = [2:n]
        aux = aux + ((x(i)-x(i-1)) * (y(i) + y(i-1)));
    endfor
    I = aux / 2;
endfunction