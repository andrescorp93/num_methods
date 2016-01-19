function [a,m,d,t] = gen_8_sel(n)
    xm = 5;
    v = 1-integral(@(x)4*x.^2.*exp(-x.^2)/sqrt(pi),0,xm);
    while v > eps
        xm = xm+0.001;
        v = 1-integral(@(x)4*x.^2.*exp(-x.^2)/sqrt(pi),0,xm);
    end
    tic;
    a = zeros(1,n);
    j = 1;
    while j < n+1
        g1 = xm*rand(1);
        g2 = rand(1);
        p = 4*g1.^2*exp(-g1.^2)/sqrt(pi);
        if p > g2
            a(j) = g1;
            j = j+1;
        end
    end
    m = mean(a);
    d = var(a)*(n-1)/n;
    t = toc;
end
