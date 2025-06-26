function df = extrapRichardson2(f, x, h)
    df = (4/3)*trespuntos(f, x, h/2) - (1/3)*trespuntos(f, x, h);
endfunction