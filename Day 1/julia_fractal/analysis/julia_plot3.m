% Jun Allard jun.allard@uci.edu
% Compute the Julia Set
% for z0, does the mapping z(n+1)=z(n)^2+c, z(0)=z0 go to infinity or
% remain finite? If it goes to infinity, we define z0 as in the Julia set. 
% https://en.wikipedia.org/wiki/Julia_set

%% Plot

clear

<<<<<<< HEAD
load('..\data\juliaSet3.mat');
=======
load('/Users/matthewbovyn/Desktop/juliafrac/data/juliaSet3.mat');
>>>>>>> 5dea9721b88e0d9d439c6dc4bd0810479ba13720

juliaSet = nmax<22; % Julia set is defined as p values that mapped to infinity (here defined as abs(z)>2).

% plot black and white
f1=figure(1); clf; hold on; box on;
plot(real(p(juliaSet)), imag(p(juliaSet)), '.k');

<<<<<<< HEAD
% plot coloring according to exit number
figure(2); clf; hold on; box on;
scatter(real(p(juliaSet)), imag(p(juliaSet)), 10, nmax(juliaSet));
colormap(cool);

saveas(f1,'julia3.png')
=======
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 10 10]);
print('julia3','-dpng','-r100')

% plot coloring according to exit number
figure(2); clf; hold on; box on;
scatter(real(p(juliaSet)), imag(p(juliaSet)), 10, nmax(juliaSet));
colormap(cool);
>>>>>>> 5dea9721b88e0d9d439c6dc4bd0810479ba13720
