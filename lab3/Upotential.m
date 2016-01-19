function [ energy ] = Upotential( part,  x, y, z, l, n )
energy = 0;
for i = 1:n
    if part ~= i
        dx = x(part) - x(i);
        dy = y(part) - y(i);
        dz = z(part) - z(i);
        if dx > l/2
            dx = dx - l;
        else
            if dx < -l/2
                dx = dx + l;
            end
        end
        
        if dy > l/2
            dy = dy - l;
        else
            if dy < -l/2
                dy = dy + l;
            end
        end
        
        if dz > l/2
            dz = dz - l;
        else
            if dz < -l/2
                dz = dz + l;
            end
        end
        
        d = sqrt(dx.^2 + dy.^2 + dz.^2);
        energy = energy + 4*(d.^(-12) - d.^(-6));
    end
end
end
