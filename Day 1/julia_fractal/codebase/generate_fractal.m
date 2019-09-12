<<<<<<< HEAD
p=-2+4*rand(1,1000000)+-2i+4*rand(1,1000000)*1i;
nmax=zeros(1,1000000);
for i=1:1000000
    [nmax(i),~]=follow_z(p(i),c);
end
=======
% Jun Allard jun.allard@uci.edu
% Algorithm choices: 
% (1) This code uses variables that are complex number. One
% could alternatively use just real numbers, and represent complex numbers
% as a pair of real numbers.
% (2) We explore p values randomly uniformly in a rectangular range. We could
% alternatively explore p values in a grid.

% should set a complex number c before running
if ~exist('c','var')
    error('Need a value for the parameter stored in c')
end

NStartingPoints=1E6;

% random starting points p, uniform in a rectangular region of the complex
% plane
pReMin = -2;
pReMax = +2;
pImMin = -2;
pImMax = +2;

p = pReMin + (pReMax-pReMin)*rand(1,NStartingPoints) + ...
     (pImMin + (pImMax-pImMin)*rand(1,NStartingPoints))*1i;

% initialize a vector to store the escape timestep (or ntMax, if it never
% escaped)
nmax = 0*p; 
 
tic;
for iStartingPoint=1:NStartingPoints
    
    nmax(iStartingPoint)=followz(p(iStartingPoint),c);

end % finished loop through starting points
toc
>>>>>>> 5dea9721b88e0d9d439c6dc4bd0810479ba13720
