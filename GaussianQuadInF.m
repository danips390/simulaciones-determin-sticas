function [Ans] = GaussianQuadInF(Function,A,W,Nodes)
    syms x
    Legendre=legendreP(Nodes,x);
    Roots=(solve(Legendre,x));
    LegendreDiff=diff(Legendre,x);
    LegendreDiffeval=(subs(LegendreDiff,Roots));
    Denominator=(1-Roots.^2).*(LegendreDiffeval.^2);
    Weight=2./Denominator;

    FunctionEval=Function(Roots./(1-Roots.^2),A,W);
    WeightsEval=FunctionEval.*Weight.*((1+Roots.^2)./((1-Roots.^2).^2));
    Ans=vpa(sum(WeightsEval));
end