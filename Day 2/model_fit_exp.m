load('actin_lengths.mat')
[f,x]=ecdf(sizes);
minx=19;
expsse=@(params)sumsquarederrors(@expcdf,params,sizes,minx);

a = fminsearch(expsse,[400,1,50]);
figure
hold on
stairs(x,f)
plot(0:140,expcdf(0:140,a(2),a(3)))
title('exp')

function sse = sumsquarederrors(fun,params,sizes,minx)
    [f,x]=ecdf([sizes zeros(1,floor(params(1)))]);
    y=fun(x,params(2),params(3));
    indices=find(x>minx);
    sse=sum((y(indices)-f(indices)).^2);
end
