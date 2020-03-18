function [Ixy] = IM_95109564(X,Y)

X=X';
Y=Y';
d=2;
n=length(X);
hx=n^(-1/(d+4))*(4/(d+2))^(1/(d+4));
sum=0;
for is=1:n
    pxy=estim_density([X(is),Y(is)]',[X;Y],hx);
    px=estim_density(X(is),X,hx);
    py=estim_density(Y(is),Y,hx);
    sum=sum+log(pxy/(px*py));
end
Ixy = log2(exp(1))*sum/n;


