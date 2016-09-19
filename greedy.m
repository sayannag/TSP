function [p,lnew] = greedy(s,D)
n = size(D,1);
p = zeros(1,n,'uint16');
p(1) = s;

for k = 2:n
    D(s,:) = inf;
    [junk,s] = min(D(:,s)); %#ok
    p(k) = s;
end
 nu=numel(p);
 q = double(p);
 indices = sub2ind([nu,nu],q,[q(2:nu),q(1)]);
 lnew= sum(D(indices));
end
%--------------------------------------------------------------------------