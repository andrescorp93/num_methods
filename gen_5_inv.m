function [a,m,d,t] = gen_5_inv(n)
    tic;
    a = zeros(1,n);
    for j = 1:n
        g = rand(1);
        a(j) = fzero(@(x)((sin(2*x)-2*cos(x)+2)/4-g),[0 pi]);
    end
    m = mean(a);
    d = var(a)*(n-1)/n;
    t = toc;
end
