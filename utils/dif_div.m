function c = dif_div(x, y)
    n = length(x);
    Q = zeros(n, n);
    Q(:,1) = y';  % First column contains the y values
    
    for j = 2:n
        for i = j:n
            Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / (x(i) - x(i-j+1));
        end
    end
    
    c = diag(Q)';  % Return the diagonal elements as coefficients
end