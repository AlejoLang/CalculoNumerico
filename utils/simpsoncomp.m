function I = simpsoncomp(x, y)
    % Verificar que el número de puntos sea impar
    n = length(x);
    if mod(n, 2) == 0
        error('El número de puntos debe ser impar para la regla compuesta de Simpson');
    end
    
    % Verificar que x e y tengan el mismo tamaño
    if length(y) ~= n
        error('Los vectores x e y deben tener el mismo tamaño');
    end
    
    % Implementación de la regla compuesta de Simpson
    h = (x(end) - x(1)) / (n-1);
    I = y(1) + y(n);  % Primer y último punto
    
    % Suma de términos con coeficiente 4
    for i = 2:2:n-1
        I = I + 4*y(i);
    end
    
    % Suma de términos con coeficiente 2
    for i = 3:2:n-2
        I = I + 2*y(i);
    end
    
    I = (h/3) * I;
endfunction