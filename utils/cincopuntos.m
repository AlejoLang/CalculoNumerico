function df = cincopuntos(f, x, h)
    df = (-f(x + 2*h) + 8*f(x + h) - 8*f(x - h) + f(x - 2*h)) / (12 * h);
endfunction