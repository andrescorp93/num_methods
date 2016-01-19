function [Xf, Yf, Zf] = metropolis(L,T,Ti,X,Y,Z)
    Ustep = zeros(1,Ti);
    fullE = 0;
    n = length(X);
    delta = 0.1*L/nthroot(n,3);
    for j = 1:n
        fullE = fullE + Upotential( j, X, Y, Z, L, n )/2;
    end
    for i = 1:Ti
        Ustep(i) = fullE;
        part = randi(n);
        coord = randi(3);
        gamma = rand();
        shift = (2*gamma - 1)*delta;
        Uold = Upotential( part, X, Y, Z, L, n );
        if coord == 1
            X(part) = X(part) + shift;
            if X(part) > L
                X(part) = X(part) - L;
            end
            if X(part) < 0
                X(part) = X(part) + L;
            end
            Unew = Upotential( part, X, Y, Z, L, n );
            if  exp((Uold - Unew)/T) < gamma
                X(part) = X(part) - shift;
            end
            if X(part) > L
                X(part) = X(part) - L;
            end
            if X(part) < 0
                X(part) = X(part) + L;
            end
            fullE = fullE + (Upotential( part, X, Y, Z, L, n ) - Uold);
        end
        if coord == 2
            Y(part) = Y(part) + shift;
            Unew = Upotential( part, X, Y, Z, L, n );
            if Uold - Unew < 0 && exp((Uold - Unew)/T) < gamma
                Y(part) = Y(part) - shift;
            end
            if Y(part) > L
                Y(part) = Y(part) - L;
            end
            if Y(part) < 0
                Y(part) = Y(part) + L;
            end
            fullE = fullE + (Upotential( part, X, Y, Z, L, n ) - Uold);
        end
        if coord == 3
            Z(part) = Z(part) + shift;
            Unew = Upotential( part, X, Y, Z, L, n );
            if Uold - Unew < 0 && exp((Uold - Unew)/T) < gamma
                Z(part) = Z(part) - shift;
            end
            if Z(part) > L
                Z(part) = Z(part) - L;
            end
            if Z(part) < 0
                Z(part) = Z(part) + L;
            end
            fullE = fullE + (Upotential( part, X, Y, Z, L, n ) - Uold);
        end
    end
    Xf = X;
    Yf = Y;
    Zf = Z;
    U = Ustep;
    save('U.mat','U')
%clc();
%iteration=1:1:N;
%plot(iteration,Ustep); 
end
