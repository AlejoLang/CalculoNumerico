function A = doolittle(A) 
  n = length(A(:,end));
  for i = [1:n]
    A([i+1:n], i) = A([i+1:n], i) ./ A(i,i);
    A([i+1:n], [i+1:n]) -= A([i+1:n], i)*A(i, [i+1:n]);
    A([i+1:n], n) -=  A([i+1:n], i) * A(i, n);
  endfor
endfunction