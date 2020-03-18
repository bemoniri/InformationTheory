function [C] = BlahutArimoto_95109564(p)
[m, n] = size(p);
r = ones(1,m)/m;
tol = 1e-7;

% Phase 1
iter = 0;
while (1)
    if (iter > 1e3)
        break
    end
    for j = 1:n
        q(:,j) = r'.*p(:,j);
        q(:,j) = q(:,j)/sum(q(:,j));
    end
    for i = 1:m
        rprod(i) = prod(q(i,:).^p(i,:));
    end
    rprod = rprod/sum(rprod);
    
    if sqrt(sum((rprod - r).^2)) >= tol        
        r = rprod;
    else
        break
    end    
    iter = iter + 1;
end


% Phase 2
C = 0;
for i = 1:m
    for j = 1:n
        if r(i) > 0 && q(i,j) > 0
            C = C+ r(i)*p(i,j)* log(q(i,j)/r(i));
        end
    end
end
C = log2(exp(1)) * C;