% Simulate a discrete-time dynamical system

% x- population of RABBITS in thousands
% n- time in WEEKS

nMax = 300;% max number of days to simulate
r_trials=100;
r=2:(3-2)/(r_trials-1):3;
x = ones(length(r),nMax); % population
K=0.6;

x(:,1)=(6/7)*K;

for i=1:length(r)
    for n=2:nMax
        x(i,n) = x(i,n-1) + r(i)*(1-(x(i,n-1)/K))*x(i,n-1);

    end % finished loop through days
end
figure
hold on
for i=1:length(r)
    plot(r(i),x(i,(nMax/2):end),'o')
end
ylabel('Rabbits (in thousands)');
xlabel('growth constant');