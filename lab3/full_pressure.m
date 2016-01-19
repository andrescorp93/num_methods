function [p] = full_pressure(X,Y,Z,L,T)
    n = length(X);
    p = n*T/(L.^3)-pressure(X,Y,Z,L,n)/(6*L.^3);
end
