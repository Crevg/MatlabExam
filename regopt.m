## Instituto Tecnológico de Costa Rica
## Área Académica de Ingeniería en Computadores
## CE-3102 Análisis Numérico para Ingeniería
## Prof. Pablo Alvarado
## I Semestre 2018
## Examen Final

## PROBLEMA 1

## NOMBRE:
## CARNE:

2;

## Cargar los datos
X=load("-ascii","regresion.dat");

####################################################
## Problema 1.1                                   ##
## Grafique los puntos bidimensionales            ##
####################################################
figure(1);
hold off;

####################################################
## Problema 1.2                                   ##
## Implemente la función de error                 ##
####################################################
function val=f(abc,X)
  ## abc: vector columna [a,b,c]' con los parámetros de la función cuadrática
  ## X:   datos para evaluar la función, un dato por columna

  val=0; # Borre esta línea

  ## Ponga su código aquí:

  
endfunction


####################################################
## Problema 1.3                                   ##
## Implemente el gradiente de la función de error ##
####################################################
function val=gf(abc,X)
  ## abc: vector columna [a,b,c]' con los parámetros de la función cuadrática
  ## X:   datos para evaluar la función, un dato por columna
  
  val=[0,0,0]'; # Borre esta línea

  ## Use diferenciación NUMERICA para calcular el gradiente de f:


  
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

