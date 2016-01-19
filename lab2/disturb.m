function [h] = disturb(L,N,n)
    theta = zeros(1,N);
    i = 1;
    while i < N + 1
        [w,phi] = neutron_run(L);
        if w == 1 
            theta(i) = phi;
            i = i + 1;
        end
    end
    h = zeros(1,n);
    htheta = pi/n;
    thetae = -pi/2:htheta:pi/2;
    for i = 1:N
        for j = 1:n
            if ((theta(i)>=thetae(j)) && (theta(i)<thetae(j+1)))
                h(j) = h(j) + 1;
            end
        end
    end
    h = h / N;
end
