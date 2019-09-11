koff=2;
maxkon=20;
konstep=0.1;
kon=0:konstep:maxkon;
x=zeros(1,length(kon));
for i=1:length(kon)
    dt=1/max(kon(i),koff)*(1/100);
    pon=dt*kon(i);
    poff=dt*koff;
    ttotal=5;
    time=0:dt:ttotal;
    steps=length(time);
    x(i)=1;

    for j=2:steps
        if rand < poff
            if x(i)>1
                x(i)=x(i)-1;
            end
        end
        if rand < pon
            x(i)=x(i)+1;
        end
    end
end
figure
plot(kon,x)