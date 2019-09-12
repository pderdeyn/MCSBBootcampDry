% set up initial conditions
Ptot = 1; %in uM
A0 = 0;
Itot=logspace(0,4,10);
I0 = Itot;
AP0=0;
IK0=0;
%Ktot=1;


% set rates
kaon = 10;
kaoff = 10;
kion = 10;
kioff = 10;
kicat = 10;
kacat = 100;

Ktot= logspace(-3,2,50);
Ass = zeros(length(Itot),length(Ktot));
for j=1:length(Itot)
    for i=1:length(Ktot)
        % create differential equations
        dAdt = @(A,AP,IK) kacat*IK-kaon*A*(Ptot-AP)+kaoff*AP;
        dIdt = @(I,AP,IK) -kion*I*(Ktot(i)-IK)+kioff*IK+kicat*AP;
        dAPdt =  @(A,AP) kaon*A*(Ptot-AP)-kaoff*AP-kicat*AP;
        dIKdt = @(I,IK) kion*I*(Ktot(i)-IK)-kioff*IK-kacat*IK;
        dxdt = @(t,x) [ dAdt(x(1),x(3),x(4));
                dIdt(x(2),x(3),x(4));
                dAPdt(x(1),x(3));
                dIKdt(x(2),x(4))  ];

        % solve system
        [T,X] = ode45(dxdt,[0,3],[A0,I0(j),AP0,IK0]);
        Ass(j,i)=X(end,1);
    end
end
%% plot
%figure; hold on; box on;
%plot(log(Ktot),Ass,'LineWidth',2);
%plot(T,sum(X,2),'--k','LineWidth',2);

%legend('A', 'I', 'AP','IK');

figure;
[X,Y] = meshgrid(log(Ktot),log(Itot));
surf(X,Y,Ass)