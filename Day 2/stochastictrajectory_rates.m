kon=20;
koff=5;
dt=1/max(kon,koff)*(1/100);
pon=dt*kon;
poff=dt*koff;
ttotal=5;
time=0:dt:ttotal;
steps=length(time);
x=zeros(1,steps);
x(1)=1;
for i=2:steps
    x(i)=x(i-1);
    if rand < poff
        if x(i)>1
            x(i)=x(i)-1;
        end
    end
    if rand < pon
        x(i)=x(i)+1;
    end
end
figure
plot(time,x)
xlabel('Time (seconds)')
ylabel('Length (number of monomers')
figure
hist(x)