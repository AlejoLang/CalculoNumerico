function [A, r] = doolittle_p(A)
  n = length(A(:,end));
  r = 1:n;
  for i = [1:n]
    [pmax, p] = max(abs(A(r(i:n), i)));
    p = p + i - 1;
    if p != i
      r([p i]) = r([i p]);
    endif
    A(r(i+1:n), i) = A(r(i+1:n), i) ./ A(r(i),i);
    A(r(i+1:n), [i+1:n]) -= A(r(i+1:n), i)*A(r(i), i+1:n);
  endfor
endfunction