addpath(pwd)
function s = sumaMet1(n, a, b)
  tic;
  s = 0;
  for i = 1:n
    for j = 1:i
      s += a(i)*b(j);
    endfor
  endfor
  toc
endfunction

function s = sumaMet2(n, a, b)
  tic;
  s = 0;
  aux = 0;
  for i = 1:n
    for j = 1:i
      aux += b(j);
    endfor
    s += aux*a(i);
    aux = 0;
  endfor
  toc
endfunction

n = 10000;

a = randi(10, 1, n);
b = randi(10, 1, n);

s1 =sumaMet1(n, a ,b)
s2 =sumaMet2(n, a ,b)
