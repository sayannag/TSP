function [p,L] = tspsearch(X,m)
[n,dim] = size(X);
if dim == 2 || dim == 3
   
D = distmat(X);
elseif n == dim && min(X(:)) >= 0 && isequal(X,X')
    
D = X;
else
    mess = 'First argument must be Nx2, Nx3 or symmetric and nonnegative.';
    error('tspsearch:first',mess)
end

if nargin < 2 || isempty(m)
    m = 1;
elseif ~isscalar(m) || m < 1 || m > n || fix(m) < m
    mess = 'M must be an integer in the range 1 to %d.';
    error('tspsearch:second',mess,n)
end

s = randperm(n);
p=s;
h2=figure;
x1=X(s,2);
y1=X(s,3);
plot(x1,y1,'-o','MarkerSize',2);
Lmin = inf;
for k = 1:m
    % Simulated annealing
    [p,L] = simulated_annealing(p,D);
    p1=p;
     h5=figure;
     x1=X(p1,2);
     y1=X(p1,3);
     plot(x1,y1,'-o','MarkerSize',2);
 	 
     %greedy
     
     p = greedy(s(k),D);
     p1=p;
     h2=figure;
     x1=X(p1,2);
     y1=X(p1,3);
     plot(x1,y1,'-o','MarkerSize',2);
     
    % Improve tour by 2-opt heuristics
	[p,L] = two_opt_exchange(p,D);
    p2=p;
    p2
    
    % Keep best tour
	if L < Lmin
        Lmin = L;
        pmin = p;
	end
end

p = double(pmin);
L = Lmin;


%--------------------------------------------------------------------------


