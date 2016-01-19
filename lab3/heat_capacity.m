function [Cv] = heat_capacity(X,Y,Z,L,T)
    n = length(X);
    [Xtemp,Ytemp,Ztemp] = metropolis(L,T,1000000,X,Y,Z);
    cU = 0;
    for j = 1:1000
        load('U.mat','U');
        cU = cU+var(U)/1000;
        [Xtemp,Ytemp,Ztemp] = metropolis(L,T,1000,Xtemp,Ytemp,Ztemp);
    end
    Cv = 3*n/2+cU/(T.^2);
end
