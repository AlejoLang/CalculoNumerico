function[x,it,r_h]=sor(A,b,x0,maxit,tol,w)
    L = tril(A, -1);
    U = triu(A, 1);
    D = eye(length(b)) * diag(diag(A));
    r_h = ones(1, maxit);
    if(abs(det(D + ( w*L ))) <= 1e-16)
        disp("No se puede invertir D");
        x = 0;
        it = 0;
        r_h = inf;
        return
    endif
    T = inv(D + (w * L)) * (((1-w) * D) - (w * U));
    c = inv(D + (w * L)) * (w * b);
    for it = [1:maxit]
        x = (T * x0) + c;
        r_h(it) = max(abs(x - x0))/max(abs(x));
        if(r_h(it) <= tol)
            return
        endif
        x0 = x;
    endfor
endfunction