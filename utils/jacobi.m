function [x,it,r_h] = jacobi(A,b,x0,maxit,tol)
    L = tril(A, -1);
    U = triu(A, 1);
    D = eye(length(b)) * diag(diag(A));
    r_h = ones(1, maxit) * 0;
    if(abs(det(D)) <= 1e-6)
        disp("No se puede invertir D");
        x = 0;
        it = 0;
        r_h = inf;
        return
    endif
    T = - inv(D) * (L + U);
    c = inv(D) * b;
    for it=[1:maxit]
        x = T*x0 + c;
        r_h(it) = norm(x - x0, "inf") / norm(x, "inf");
        if(r_h(it) < tol) 
            return
        endif
        x0 = x;
    endfor
endfunction
