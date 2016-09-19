function L=fitness(s,D)
    n=numel(s);
    q = double(s);
    indices = sub2ind([n,n],q,[q(2:n),q(1)])
    L = sum(D(indices));
end