function [a, b, c, d] = cubic_spline_natural(x, f)
    n = length(x);
    h = x(2:n) - x(1:n-1);
    z = zeros(1, n);
    z(2:n-1) = ((3 ./ h(2:n-1)) .* (f(3:n) - f(2:n-1))) - ((3 ./ h(1:n-2)) .* (f(2:n-1) - f(1:n-2)));

    M = eye(n);
    for i = 2:n-1
        M(i,i) = 2*(h(i-1)+h(i));
        M(i,i-1) = h(i-1);
        M(i,i+1) = h(i);
    endfor
    z = z';
    c = gauss_p(M, z);
    a = f(1:n-1)';
    b = (f(2:n) - f(1:n-1))' ./ h' - (2*c(1:n-1) + c(2:n)) .* h' / 3;
    d = (c(2:n) - c(1:n-1)) ./ (3*h');
    c = c(1:n-1);

endfunction