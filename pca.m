## Instituto Tecnológico de Costa Rica
## Área Académica de Ingeniería en Computadores
## CE-3102 Análisis Numérico para Ingeniería
## Prof. Pablo Alvarado
## I Semestre 2018
## Examen Final

## PROBLEMA 3

## NOMBRE: Cristofer Villegas   
## CARNE: 201262992

3;

## Cargue los datos 
X=load("-ascii","pcadata.dat");
N=columns(X);

################################################
## Problema 3.1                               ##
## Grafique los datos                         ##
################################################
figure(1)
plot3(X(1,:), X(2,:), X(3,:), 'x')

################################################
## Problema 3.2                               ##
## Calcule la media de los datos              ##
################################################

#Cómo se calcula en el pdf

u1 = mean(X(1,:))
u2 = mean(X(2,:))
u3 = mean(X(3,:))
U = [u1, u2, u3];

################################################
## Problema 3.3                               ##
## Muestre la media en rojo                   ##
################################################

figure(1);
hold on;
plot3(u1, u2, u3, 'or')

################################################
## Problema 3.4                               ##
## Calcule los datos sin media                ##
################################################
Xm = [X(1,:)-u1; X(2,:)-u2; X(3,:)-u3];

figure(2);
hold off;
plot3(Xm(1,:), Xm(2,:), Xm(3,:), 'x')

################################################
## Problema 3.5                               ##
## Calcule la matriz de covarianza            ##
################################################

#Cómo se calcula en el pdf

Ex = cov(Xm(:,:)');

################################################
## Problema 3.6                               ##
## Encuentre los eigenvalores y eigenvectores ##
################################################

[eigVec, eigVal] = eig(Ex, "vector");


################################################
## Problema 3.7                               ##
## Reordene los eigenvectores para PCA        ##
################################################

[~, permut] = sort(abs(eigVal), "descend"); 
#permut tiene los indices en los que se deben ordenar las columnas 
#de los eigenvectores y los eigenvalores para que queden en orden
#decendente
eigVal = eigVal(permut);
eigVec = eigVec(:,permut);

########################################################################
## Problema 3.8                                                       ##
## Cuáles son los ejes principales y qué varianza tiene los datos     ##
########################################################################

#Los dos ejes principales son el Z y el Y (Expandido en el PDF)

########################################################################
## Problema 3.9                                                       ##
## Calcule la proyección de los datos al plano engendrado por los dos ##
## eigenvectores                                                      ##
########################################################################

P = eigVec(:, [1,2]);

Y = P' * Xm;

## Grafique la proyección
figure(3);
hold off;
plot(Y(1,:), Y(2,:) , 'x')

########################################################################
## Problema 3.10                                                      ##
## Calcule los datos reconstrudos a partir de los datos proyectados   ##
########################################################################
Xmr = P*Y;
Xr = [Xmr(1,:) + u1; Xmr(2,:) + u2; Xmr(3,:) + u3 ];
figure(4);
hold off;
plot3(Xr(1,:), Xr(2,:), Xr(3,:), 'sm')
hold on;
plot3(X(1,:), X(2,:), X(3,:), 'x')
