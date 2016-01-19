function [a,m,d,t] = gen_8_chinv(n)
    tic;
    a = zeros(1,n);
    for j = 1:n
        g1 = rand(1);
        g2 = rand(1);
        phi = fzero(@(x)(4*x-sin(4*x)-2*pi*g1),[0 pi/2]);
        r = fzero(@(x)(1-exp(-x^2)*(x^4+2*x^2+2)/2-g2),[0 1000000]);
        a(j) = r*cos(phi);
    end
    m = mean(a);
    d = var(a)*(n-1)/n;
    t = toc;
end

