function [t] = experiment()
    clc;
    [X,Y,Z] = generator(6,8);
    T = (162/232):(0.2/232):(166/232);
    L = 5.9:0.001:7.1;
    Ti = 5000000;
    m = length(T);
    n = length(L);
    tic;
    [X,Y,Z] = metropolis(L(1),T(1),Ti,X,Y,Z);
    load('U.mat','U');
    save('result/U.mat','U');
    pVT = zeros(m,n);
    CVT = zeros(m,1);
    for i = 1:m
        X = L(1)*X/L(n);
        Y = L(1)*Y/L(n);
        Z = L(1)*Z/L(n);
        pVT(i,1) = full_pressure(X,Y,Z,L(1),T(i));
        CVT(i) = heat_capacity(X,Y,Z,L(1),T(i));
        disp(CVT(i))
        for j = 2:n
            X = L(j)*X/L(j-1);
            Y = L(j)*Y/L(j-1);
            Z = L(j)*Z/L(j-1);
            pVT(i,j) = full_pressure(X,Y,Z,L(j),T(i));
            disp(pVT(i,j))
        end
    end
    save('result/X.mat','X');
    save('result/Y.mat','Y');
    save('result/Z.mat','Z');
    save('result/pVT.mat','pVT');
    save('result/CVT.mat','CVT');
    t = toc;
end
