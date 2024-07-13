clc;
clear;

f=@(x)exp(-x.^2); %declaro la función que se va a integrar

n=1000; %declaro la cantidad de numeros aleatorios
b=1; %limite superior de la integral
a=-1 ; %limite inferior de la integral
r = a + (b-a)*rand(n,1); %generando números aleatorios en el intervalo
inte=integral(f,a,b); %resultado analítico

resMC=((b-a)/n)*sum(f(r)); %haciendo la suma del método de montecarlo 

error=abs(inte-resMC);
error=error./inte;
disp("Resultado MC: "+string(resMC))
disp("Resultado Analítico: "+string(inte))
disp("Error: "+string(error))