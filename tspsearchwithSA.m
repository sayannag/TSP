function [p,L] = tspsearchwithSA(X,m)


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
p1=p;
h2=figure;
x1=X(s,2);
y1=X(s,3);
plot(x1,y1,'-o','MarkerSize',2);
Lmin = inf;
for k = 1:m
%      [p1,L] = greedy(p1(k),D);
% %     p1=p;
%       h5=figure;
%       x1=X(p1,2);
%       y1=X(p1,3);
%       plot(x1,y1,'-o','MarkerSize',2);
  %  [p,L]=simulated_annealing(p,D,X);
   % p1=p;
%      hold off;
%                 x=X(p,2);
%                 y=X(p,3);
%                 plot(x,y,'-o','MarkerSize',2);
%                 drawnow;
    % Nearest neighbour tour
   %   p = greedy(p(k),D);
  % for ty=1:30
   [p,L]=lin_kernighan(p,D,X);
%      p1=p;
%      h2=figure;
%      x1=X(p1,2);
%      y1=X(p1,3);
%      plot(x1,y1,'-o','MarkerSize',2);
            [p,L] = greedy(p(k),D);
%                hold off;
                L
                hold off;
                x=X(p,2);
                y=X(p,3);
                plot(x,y,'-o','MarkerSize',2);
                xlabel(['Iterations = ',num2str(1),'cost = ',num2str(L)])
                drawnow;
 %  end
              %  drawnow;
    % Improve tour by 2-opt heuristics
	%[p,L] = simulated_annealing(p,D);
    p2=p;
    
    % Keep best tour
	if L < Lmin
        Lmin = L;
        pmin = p;
	end
end

% Output
p = double(pmin);
L = Lmin;


%--------------------------------------------------------------------------


