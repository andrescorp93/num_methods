function [X, Y, Z] = generator(m,L)
    n=m^3;
    X = zeros(n,1);
    Y = zeros(n,1);
    Z = zeros(n,1);
    l = L/m;
    dx = L/(2*m);
    X(1)=dx;
    dy = L/(2*m);
    Y(1)=dy;
    dz = L/(2*m);
    Z(1)=dz;
    for i = 2:n
        if mod((i-1),m)~=0
            X(i) = dx;
        else
            if mod((i-1),m*m)~=0
                dx = dx + l;
                X(i) = dx;
            else
                dx = l/2;
                X(i) = dx;
            end
        end
        if mod(i-1,m)~=0
            dy = dy + l;
            Y(i) = dy;
        else
            dy = l/2;
            Y(i) = dy;
        end
        if mod(i-1,m*m)~=0
            Z(i) = dz;
        else
            dz = dz+l;
            Z(i) = dz;
        end
    end
end
