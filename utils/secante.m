function [x, h] = secante(f, xmin, xmax, kmax, tol)
    q1 = f(xmin);
    q2 = f(xmax);
    h = [];
    for i = 1:kmax
        x = xmin - ((q1 * (xmax - xmin)) / (q2 - q1));
        h = [h abs(x-xmax)];
        if(h(1, i) < tol)
            return
        endif
        xmin = xmax;
        xmax = x;
        q1 = q2;
        q2 = f(x);
    end
endfunction