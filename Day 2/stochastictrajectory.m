t=14000;
x=zeros(1,t);
x(1)=1;
for i=2:t
    if rand < 0.5
        if x(i-1)>1
            x(i)=x(i-1)-1;
        else
            x(i)=x(i-1);
        end
    else
        x(i)=x(i-1)+1;
    end
end
figure
plot(x)
title(mean(x))
xlabel('Time (Steps)')
ylabel('Length (number of monomers')