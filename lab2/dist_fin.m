function [ t ] = dist_fin()
    tic;
    L = 10;
    N = 20000;
    n = 20;
    r = 20;
    ht = zeros(r,n);
    hm = zeros(1,n);
    dh = zeros(1,n);
    for i = 1:n
        ht(i,:) = disturb(L,N,n);
    end
    for i = 1:r
        hm(i) = mean(ht(:,i));
        dh(i) = var(ht(:,i))*(r-1)/r;
    end
    t = toc;
    fans=zeros(2,n);
    htheta = pi/n;
    thetam = (-pi+htheta)/2:htheta:(pi-htheta)/2;
    fans(1,:)=thetam;
    fans(2,:)=hm;
    dlmwrite('dist_fin.txt',fans',' ');
    fans(2,:)=dh;
    dlmwrite('errors.txt',fans',' ');
end
