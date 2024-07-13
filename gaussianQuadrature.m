clear
clc
format long

f = @(x) exp(x.^2);
a = -1;
b = 3;

res = gaussianQuad(f,a,b,64);
disp("resultado cuadratura: "+string(vpa(res)))

syms x
analitico = vpa(int(exp(x^2),a,b)); % No olvidar cambiar función
fprintf("resultado analítico: %s \n",string(analitico))

Ea = abs(analitico-res);
Er = Ea/analitico;
disp("Error relativo: "+string(vpa(Er)))

function [res] = gaussianQuad(f,a,b,N)
    % Cuadratura gaussiana, f es la función anonima con la funcion a
    % integrar, a es el limite inferior y b es el superior, N es el grado
    % que se quiere usar para el método, los disponibles son del 2 al 64

    fileName = 'xi.json'; % filename in JSON extension
    fid = fopen(fileName); % Opening the file
    data = char(fread(fid,inf)'); % Reading the contents
    fclose(fid); % Closing the file
    xi = jsondecode(data); % Using the jsondecode function to parse JSON from string
    
    fileName = 'wi.json'; % filename in JSON extension
    fid = fopen(fileName); % Opening the file
    data = char(fread(fid,inf)'); % Reading the contents
    fclose(fid); % Closing the file
    wi = jsondecode(data); % Using the jsondecode function to parse JSON from string
    
    
    N = "x"+num2str(N); % Obtener los valores correspondientes con el número de nodos

    res = ((b-a)/2)*sum(wi.(N).*f(((b-a)/2).*(xi.(N))+((a+b)/2))); % Cuadratura
end