load('actin_lengths.mat')
[f,x]=ecdf(sizes);

gamsse=@(params)sumsquarederrors(@gamcdf,params,sizes);

a = fminsearch(gamsse,[1,50]);
figure
hold on
stairs(x,f)
plot(0:140,gamcdf(0:140,a(1),a(2)))
title('gamma')

wbsse=@(params)sumsquarederrorsweibull(@cdf,params,sizes);
a = fminsearch(wbsse,[10,3]);
figure
hold on
stairs(x,f)
plot(0:140,cdf('weibull',0:140,a(1),a(2)))
title('weibull')

wbsse=@(params)sumsquarederrors(@expcdf,params,sizes);
a = fminsearch(wbsse,mean(sizes));
figure
hold on
stairs(x,f)
plot(0:140,expcdf(0:140,a))
title('exp')

function sse = sumsquarederrors(fun,params,sizes)
    [f,x]=ecdf(sizes);    
    y=fun(x,params(1),params(2));
    sse=sum((y-f).^2);
end

function sse = sumsquarederrorsweibull(fun,params,sizes)
    [f,x]=ecdf(sizes);    
    y=fun('weibull',x,params(1),params(2));
    sse=sum((y-f).^2);
end
