function D = distmat(X)
[n,dim] = size(X);
D = zeros(n);
for j = 1:n
    for k = 1:dim
        v = X(:,k) - X(j,k);
        D(:,j) = D(:,j) + v.*v;
    end
end
D = sqrt(D);

%--------------------------------------------------------------------------