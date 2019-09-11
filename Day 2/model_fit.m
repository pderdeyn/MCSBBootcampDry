load('actin_lengths.mat')
figure
histogram(sizes)
ylabel('Number of filaments')
xlabel('Length (nm)')

figure
[f,x]=ecdf(sizes);
stairs(x,f)
xlabel('Length (nm)')
ylabel('Cumulative Probability')


figure
hold on
plot(x,pdf('gamma',x,1,50))
plot(x,exppdf(x,mean(sizes)))
histogram(sizes,'Normalization','pdf')
figure
histogram(sizes,'Normalization','pdf')
hold on
plot(x,pdf('gamma',x,1,50))
plot(x,exppdf(x,mean(sizes)))
hold on
