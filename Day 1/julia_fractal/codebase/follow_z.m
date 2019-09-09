function [n,z] = follow_z(z1,c)
    n=1;
    z=zeros(1,21);
    z(1)=z1;
    while(1)
        n=n+1;
        z1=z1.^2+c;
        z(n)=z1;
        if((abs(z1)>2) || (n > 22))
            break
        end
    end
    z=z(1:n);
end