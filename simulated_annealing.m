function [p,l]=simulated_annealing(p,Distance,X)
    n=numel(p);
    q = double(p);
	indices = sub2ind([n,n],q,[q(2:n),q(1)]);
	l = sum(Distance(indices));
    T=100.0;
    Tmin=1.0;
    alpha=0.99;
    while T>Tmin
        i=1;
        while i<=1000
            new_p=neighbor(p);
            q = double(new_p);
            indices = sub2ind([n,n],q,[q(2:n),q(1)]);
            lnew= sum(Distance(indices));
            ap=acceptance_probability(l,lnew,T);
            if ap>rand()
                p=new_p;
                l=lnew;
                hold off;
                x=X(p,2);
                y=X(p,3);
                plot(x,y,'-o','MarkerSize',2);
                xlabel(['Temp = ',num2str(T),'cost = ',num2str(lnew)])
                drawnow;
            end
            i=i+1;
        end
        T=T*alpha;
    end
end