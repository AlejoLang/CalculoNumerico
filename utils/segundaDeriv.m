function ddf = segundaDeriv(f, h)
    ddf = (f(x + h) - 2 * f(x) + f(x - h)) ./ (h .^ 2);
endfunction