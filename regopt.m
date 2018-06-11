## Instituto Tecnológico de Costa Rica
## Área Académica de Ingeniería en Computadores
## CE-3102 Análisis Numérico para Ingeniería
## Prof. Pablo Alvarado
## I Semestre 2018
## Examen Final

## PROBLEMA 1

## NOMBRE: CRISTOFER VILLEGAS GONZÁLEZ
## CARNE: 201262992

2;

## Cargar los datos
X=load("-ascii","regresion.dat");

####################################################
## Problema 1.1                                   ##
## Grafique los puntos bidimensionales            ##
####################################################
figure(1);
hold off;
plot(X(1,:),X(2,:), '.r')
title("Puntos bidimensionales")
xlabel("x")
ylabel("y")

####################################################
## Problema 1.2                                   ##
## Implemente la función de error                 ##
####################################################
function val=f(abc,X)
  ## abc: vector columna [a,b,c]' con los parámetros de la función cuadrática
  ## X:   datos para evaluar la función, un dato por columna

  ## Ponga su código aquí:
  val=0
  for j = 1:columns(X)
    val = val + (X(2,j) - (abc(1,1)*X(1,j)*X(1,j)+abc(2,1)*X(1,j)+abc(3,1)))*(X(2,j) - (abc(1,1)*X(1,j)*X(1,j)+abc(2,1)*X(1,j)+abc(3,1)));
  endfor  
endfunction


####################################################
## Problema 1.3                                   ##
## Implemente el gradiente de la función de error ##
####################################################
function val=gf(abc,X)
  ## abc: vector columna [a,b,c]' con los parámetros de la función cuadrática
  ## X:   datos para evaluar la función, un dato por columna
  
  ## Use diferenciación NUMERICA para calcular el gradiente de f:
  #utilizando un h de 0.0001
  h = 0.0001
  val = zeros(3, columns(X))
  for i (1:columns(X))

    dfa =  (f(abc, X(1,i)) - f([abc(1)-h, abc(2), abc(3)], X(1,i)))/(abc(1)-(abc(1)-h))
    dfb =  (f(abc, X(1,i)) - f([abc(1), abc(2)-h, abc(3)], X(1,i)))/(abc(2)-(abc(2)-h))
    dfc =  (f(abc, X(1,i)) - f([abc(1), abc(2), abc(3)-h], X(1,i)))/(abc(3)-(abc(3)-h))
    val(1,i) = dfa
    val(2,i) = dfb
    val(3,i) = dfc
    
  endfor


endfunction
####################################################
## Problema 1.4                                   ##
## Descenso de gradiente                          ##
####################################################
function [ABC,err]=optimice(f,gf,X,lambda,tol,abc0=[0,0,0]')
  ## f      es el handler de la función a optimizar
  ## gf     es el handler que calcula el gradiente de f
  ## X      es la matriz de datos 
  ## lambda es el tamaño de paso del descenso de gradiente
  ## tol    es el umbral de tolerancia para determinar convergencia
  ## abc0   es un vector [a0,b0,c0] especificando el punto inicial de
  ##        la optimización
  ## ABC    es una matrix de n x 3, donde cada fila corresponde a un
  ##        paso en el proceso de optimización.  Es decir, ABC(:,1)
  ##        corresponde siempre a abc0, y ABC(:,rows(ABC)) corresponde
  ##        a los parámetros óptimos.
  ## err    es el vector conteniendo los errores en cada paso

  if ( (rows(abc0)!=3) || columns(abc0)!=1 )
    error("Vector inicial no tiene forma 3x1");
  endif;
  
  ## Elimine la siguiente inicialización
  ABC=0; err=0;

  ## Ponga su código aquí:


  
endfunction

## Llame al optimizador con la interfaz anterior

lambda=1;  # Ajuste esto
tol=1e-10; # Ajuste esto
[ABC,err]=optimice(@f,@gf,X,lambda,tol,[0,1,0]');

####################################################
## Problema 1.5                                   ##
## Imprima el conjunto óptimo de parámetros       ##
####################################################


####################################################
## Problema 1.6                                   ##
## Muestre el error en función de las iteraciones ##
####################################################


####################################################
## Problema 1.7                                   ##
## Muestre las curvas inicial, intermedias y      ##
## final ajustadas a los datos                    ##
####################################################
hold on;

