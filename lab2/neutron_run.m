function [w,theta] = neutron_run(L)
    sr = 1.4;
    sa = 0.24;
    p = sr./(sr+sa);
    nonabsorb = true;
    x = -log(rand(1));
    theta = 0;
    while ((x < L) && (x > 0) && nonabsorb)
        g = rand(1);
        if g < p
            l = -log(rand(1));
            if rand(1) < 1/2
                theta = theta - acos(1-2*rand(1));
            else
                theta = theta + acos(1-2*rand(1));
            end
            if theta < -pi
                theta = theta + 2*pi;
            elseif theta > pi
                theta = theta - 2*pi;
            end
            x = x + l*cos(theta);
        else
            nonabsorb = false;
            w = 2;  %   absorbed
        end
    end
    if x < 0 
        w = 0;   %   reflected
    elseif x > L
        w = 1;   %   passed
    end
end
