koff=2;
maxkon=20;
konstep=0.1;
kon=0:konstep:maxkon;
x=zeros(1,length(kon));
for i=1:length(kon)
    ttotal=100;
    t=0;
    steps=length(time);
    x(i)=1;
    while (t<ttotal)
        ton=exprnd(1/kon(i));
        toff=exprnd(1/koff);
        if ton<toff
            t=t+ton;
            x(i)=x(i)+1;
        else
            t=t+toff;
            if x(i)>1
                x(i)=x(i)-1;
            end
        end
    end
end
figure
plot(kon,x)