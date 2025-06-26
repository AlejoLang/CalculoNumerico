addpath("../utils")
u=@(r,theta) 10+r.^3 .* cos(3.*theta) + 2.*r.^2 .*sin(2.*theta);
R=1;
a=-pi;
b=pi;
c=0;
d=R;
%el integrando F
F=@(r,theta) u(r,theta).*r;

%con la cuadratura de gauss, nceesito el numer de sub intervalos
L_tita=10;
L_r=10;
n=3; %punto sde gauss por suvintervalo
m=3;
% Para CADA valor de theta (integral exterior)
% calcular la integral EN r (integral interior)
integralanidada = cuad_gauss_c(@(tita) ...
           cuad_gauss_c(@(r) F(r,tita), c, d, L_r, n), ...
           a, b, L_tita, m);
integralanidada   %no anda

#tamb puedo usar una funcion de cuadratura de gauss compuesta anidada para 2 integrales del profe

int2ble= cuad_gauss_doble(F,a,b,c,d,m,n);
int2ble
%con funciones de octave
J=quad2d(F,a,b,c,d)
C=dblquad(F,a,b,c,d)
%como no dan c y p no puedo calcular el valor de E asi que solo queda E=c*p*int2ble;

%funcion doble
%{
function J=cuad_gauss_doble(f,a,b,c,d,m,n)
% segun el Burden (pag.243 version 9)
% Paso1
h1=(b-a)/2;
h2=(b+a)/2;
J=0;
% calculamos raices y coeficientes de la cuadratura de gauss
[xgm,wm]=gauss_xw(m);
A=[xgm,wm]; % matriz coeficientes "m"
[xgn,wn]=gauss_xw(n);
B=[xgn,wn]; % matriz coeficientes "n"

% Paso2
for i=1:m
  % Paso3
  JX=0;
  x = h1*A(i,1)+h2;
  %d1=d(x);
  d1=d;
  %c1=c(x);
  c1=c;
  k1=(d1-c1)/2;
  k2=(d1+c1)/2;
  % Paso4
  for j=1:n
    y=k1*B(j,1)+k2;
    Q=f(x,y);
    JX=JX + B(j,2)*Q;
  endfor
  % Paso5
  J=J+A(i,2)*k1*JX;
endfor

% Paso6 (Salida del programa)

J=h1*J;

endfunction
%}


