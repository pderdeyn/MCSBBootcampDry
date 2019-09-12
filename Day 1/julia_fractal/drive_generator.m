% Matt Bovyn, mbovyn@uci.edu
% Drive generate_fractal.m

% Set model parameter
c = -0.8 - 0.156*1i;

%set the path to the repo
%absolutePathToRepo='/julia_fractal';
localpath=pwd;

%run generate_fractal script
run([pwd '/generate_fractal.m'])

%save the unique identifier of the git commit used to generate the data
cd ..;
system('git log -1 --pretty=format:%H > "CommitUsedHash.txt"');
movefile('CommitUsedHash.txt',[ localpath '/CommitUsedHash.txt'])
cd(localpath);

% Save to file
save('juliaSet.mat', 'p', 'nmax');
