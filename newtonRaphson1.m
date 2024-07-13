clc
clear
close all

% Datos de la función, x inicial y máximo número de iteraciones
x = -1:0.01:5;
f = @(x) sin(x);
x1 = 2;
maxI=1000000;

% Graficar la función
y = f(x);
plot(x,y,'-b')
grid on
hold on

% Graficar las marcas de la "x" inicial y de "y" = 0
xline(x1,'--')
yline(0,'--g')

% Info Plot
title(char(f))

% Obtener la raiz
[x,y] = fNewtonRaphson1(f,x1,10^10-10,maxI);
disp("x: "+string(x)+" y: "+string(y))

% Graficar el punto de la raiz y sus coordenadas (Se encuentran en esquina
% superior derecha)
plot(x,y,'*R',MarkerSize=10)
xL = xlim;
yL = ylim;
text(0.99*xL(2),0.99*yL(2),"x: "+x,'HorizontalAlignment','right','VerticalAlignment','top')
text(0.99*xL(2),0.9*yL(2),"y: "+y,'HorizontalAlignment','right','VerticalAlignment','top')
hold off

% Función para obtener una raiz con el metodo de biseccion
function [x,y] = fNewtonRaphson1(f,x,tol,maxI)
    % f (función anonima), x (x inicial), tol (tolerancia), maxI (en caso de no
    % encontrar raiz detenerse en un número de iteraciones)
    e=tol+1;
    i=0;
    fdash=@(fun,x,epsilon)imag(fun(x(:)+1i*epsilon))/epsilon; % Metodo para derivar
    % una funcion anonima y obtener una funcion anonima
    fp=@(x)fdash(f,x,10^-20);
    % Loop de iteraciones
    while or(e>tol,i<=maxI) % Error menor que la tolerancia o maximo iteraciones se detiene
        xi = x-(f(x)/fp(x)); % Nueva x
        e = abs((xi-x)/xi); % Calcular error
        x = xi; % Cambio de x
        i = i+1; % Contador de iteraciones
    end
    % Raiz obtenida
    x = xi;
    y = f(xi);
end