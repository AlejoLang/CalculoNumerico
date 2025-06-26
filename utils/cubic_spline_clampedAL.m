function [a, b, c, d] = cubic_spline_clamped(x, f, df1, df2)
    n = length(x);
    h = x(2:n) - x(1:n-1);
    z = zeros(1, n);
    disp(df1)
    disp(df2)
    z(1) = 3 * (((f(2) - f(1))/ h(1)) - df1);
    z(2:n-1) = ((3 ./ h(2:n-1)) .* (f(3:n) - f(2:n-1))) - ((3 ./ h(1:n-2)) .* (f(2:n-1) - f(1:n-2)));
    z(n) = 3 * (df2 - ((f(n) - f(n-1))/ h(n-1)));

    M = eye(n);

    M(1, 2) = h(1);
    M(n, n-1) = h(end);
    M(1,1) = 2 * h(1);
    M(n,n) = 2 * h(end);

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