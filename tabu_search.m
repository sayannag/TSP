function [sBest,LBest]=tabu_search(p,D,X)
    n=numel(p);
    pmat(1,:)=p;
   
    for i=2:20
        pmat(i,:)=randperm(n);
    end
    s=pmat(1,:);
    sBest=s;
    q = double(sBest);
    indices = sub2ind([n,n],q,[q(2:n),q(1)]);
    LBest = sum(D(indices));
   % LBest=fitness(sBest,D);
    tabulist=[];
    j=1;
    while j<2
        %candidateList=[];
        pmat(1,:)=s;
       
        for i=2:20
            pmat(i,:)=randperm(n);
        end
        bestCandidate=sBest;
        for i=2:20
          %  L=fitness(pmat(i,:),D);
            q = double(pmat(i,:));
            indices = sub2ind([n,n],q,[q(2:n),q(1)]);
            L = sum(D(indices));
            if ismember(pmat(i,:),tabulist)==0
                if L>LBest
                    bestCandidate=pmat(i,:);
                    L=LBest
                    figure
                    x=X(bestCandidate,2);
                    y=X(bestCandidate,3);
                    plot(x,y,'-o','MarkerSize',2);
                    drawnow;
                end
            end
        end
        s=bestCandidate;
        q = double(bestCandidate);
        indices = sub2ind([n,n],q,[q(2:n),q(1)]);
        L1 = sum(D(indices));
        q = double(sBest);
        indices = sub2ind([n,n],q,[q(2:n),q(1)]);
        L2 = sum(D(indices));
        if L1>L2
            sBest=bestCandidate;
        end
        tabulist(j,:)=bestCandidate;
    end
    sBest
    LBest
end