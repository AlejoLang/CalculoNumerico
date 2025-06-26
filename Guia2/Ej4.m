addpath(pwd)
function x = sustAtras(A, b)
  x = A(: ,end);
  n = length(b);
  x(n) = b(n)/A(n,n);
  for i = [n-1: -1: 1]
    x(i) = (b(i) - A(i,[i+1: n]) * x([i+1:n])) / A(i,i);
  endfor
endfunction

function x = sustAdel(A, b)
  x = A(: ,end);
  n = length(b);
  x(1) = b(1)/A(1,1);
  for i = [2: n]
    x(i) = (b(i) - A(i,[1: i-1]) * x([1:i-1])) / A(i,i);
  endfor
endfunction

A = [1, -1,  2, -1;
     0,  2, -1,  1;
     0,  0, -1, -1;
     0,  0,  0,  2]

B = transpose(A)

b = [-8;
      6;
     -4;
      4]

x1 = sustAtras(A, b);
x2 = sustAdel(B, b);
display(x1);
display(x2);

