function [x,it,r_h] = gaussseidel(A,b,x0,maxit,tol)
    L = tril(A, -1);
    U = triu(A, 1);
    D = eye(length(b)) * diag(diag(A));
    r_h = ones(1, maxit) * 0;
    if(abs(det(D+L)) <= 1e-14)
        disp("No se puede invertir D+L");
        x = 0;
        it = 0;
        r_h = inf;
        return
    endif
    T = - inv(D+L) * U;
    c = inv(D+L) * b;
    for it=[1:maxit]
        x = T*x0 + c;
        r_h(it) = max(abs(x - x0)) / max(abs(x));
        if(r_h(it) < tol) 
            return
        endif
        x0 = x;
    endfor
endfunction