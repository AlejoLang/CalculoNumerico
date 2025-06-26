function dddf = tercerDeriv(f, x, h)
    dddf = f(x + 2*h) - 3*f(x + h) + 3*f(x - h) - f(x - 2*h);
    dddf = dddf ./ (2 * h .^ 3);
endfunction