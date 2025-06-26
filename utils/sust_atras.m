function [x] = sust_atras(A)
  x = A(: ,end);
  n = length(x);
  x(n) = A(n, n+1)/A(n,n);
  for i = [n-1: -1: 1]
    x(i) = (A(i, n+1) - A(i,[i+1: n]) * x([i+1:n])) / A(i,i);
  endfor
endfunction
