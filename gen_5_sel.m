function [a,m,d,t] = gen_5_sel(n)
    tic;
    a = zeros(1,n);
    j = 1;
    while j < n+1
        g1 = pi*rand(1);
        g2 = rand(1);
        p = (sin(g1)+cos(2*g1))/2;
        if p > g2
            a(j) = g1;
            j = j+1;
        end
    end
    m = mean(a);
    d = var(a)*(n-1)/n;
    t = toc;
end    
