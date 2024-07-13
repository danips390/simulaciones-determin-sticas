clc;
clear all;
close all;
A=3;
W=1/A;
Nodos=64;
P=@(t,A,W) abs(A.*sech(t./W)).^2;
P1=2*A^3*W^2
F=GaussianQuadInF(P,A,W,Nodos)
error=abs(P1-F)
