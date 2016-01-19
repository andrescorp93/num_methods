function [ p ] = pressure( x,y,z,l,n )
 count = 0; 
 ptemp = 0;
   for i=1:n
     for j=1:n
         if i ~= j
            xx = x(i) - x(j);
            yy = y(i) - y(j);
            zz = z(i) - z(j);
            if xx > l/2
                xx = xx - l;
            else
                if xx < -l/2
                    xx = xx + l;
                end
            end
        
            if yy > l/2
                yy = yy - l;
            else
                if yy < -l/2
                    yy = yy + l;
                end
            end
        
            if zz > l/2
                zz = zz - l;
            else
                if zz < -l/2
                    zz = zz + l;
                end
            end
           r = sqrt(xx^2 + yy^2 + zz^2) ;
           ptemp = ptemp + r*24*(r^(-7)-2*r^(-13));
           count =count + 1;
        end
     end
   end
   p=ptemp/count;
end
