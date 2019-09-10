p=-2+4*rand(1,1000000)+-2i+4*rand(1,1000000)*1i;
nmax=zeros(1,1000000);
for i=1:1000000
    [nmax(i),~]=follow_z(p(i),c);
end
