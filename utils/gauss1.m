function [x] = gauss1(A, b)
  n = length(b);
  A = [A b];
  for i = [1:n]
    A([i+1:n], i) = A([i+1:n], i) ./ A(i,i);
    A([i+1:n], [i+1:n]) -= A([i+1:n], i)*A(i, [i+1:n]);
    A([i+1:n], n+1) -=  A([i+1:n], i) * A(i, n+1);
  endfor
  x = sust_atras(A);
endfunction
