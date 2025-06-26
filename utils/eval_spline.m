function y = eval_spline(x_eval, x_nodes, a, b, c, d)
    y = zeros(size(x_eval));
    n = length(x_nodes);

    for j = 1:length(x_eval)
        x = x_eval(j);

        % Encuentra el intervalo [x_i, x_{i+1}] que contiene x
        for i = 1:n-1
            if x >= x_nodes(i) && x <= x_nodes(i+1)
                dx = x - x_nodes(i);
                y(j) = a(i) + b(i)*dx + c(i)*dx^2 + d(i)*dx^3;
                break;
            endif
        endfor
    endfor
endfunction