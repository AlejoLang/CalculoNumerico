function [r] = evLagrange(x, y, t)
    n = length(y);
    r = zeros(size(t));
    for i = [1:n]
        aux = ones(size(t));
        for j = [1:n]
            if(i != j)
                aux = aux .* ((t-x(j)) ./ (x(i) -x(j)));
            endif
        endfor
        r = r + y(i) .* aux;
    endfor
endfunction