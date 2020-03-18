function [pxy] = estim_density(x,X,h)
[d, N]=size(X);
Sxy=cov(X');
invS=inv(Sxy);
detS=det(Sxy);

sum=0;
for ix=1:N
    pow=(x-X(:,ix))' * invS * (x-X(:,ix));
    den = 1/sqrt((2*pi)^d*detS);
    sum=sum+den*exp(-pow/(2*h^2));
end

pxy=1/(N*h^d)*sum;