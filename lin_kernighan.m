function [Vbest,cost]=lin_kernighan(V,E,O)  
iterations=1;
%Lnew=[];
cost=Inf;

    while iterations<=100
        n=numel(V);
        for i=1:n/2
            X(i)=V(i);
            Y(i)=V(i+n/2);
        end
        E1=E;
        for i=1:n/2
            for j=1:n/2
                if i~=j
                    E(X(i),X(j))=E1(X(i),X(j));
                    E(Y(i),Y(j))=E1(Y(i),Y(j));
                end
                if i==j
                    E(X(i),X(j))=0;
                    E(Y(i),Y(j))=0;
                end
            end
        end
        for i=1:n/2
            for j=1:n/2
                I(X(i),Y(j))=E1(X(i),Y(j));
            end
        end
        for i=1:n
            G(i)=0;
        end

        for i=1:n/2
            G(X(i))=G(X(i))+E(X(i),X(j))-I(X(i),Y(j));
        end
        for i=1:n/2
            G(Y(i))=G(Y(i))+E(Y(i),Y(j))-I(X(i),Y(j));
        end
        a=0;
        b=0;
        %------------------------------------%
        %------------------------------------%
        for k=1:(n/2)
            max=-Inf;


            for i=1:n/2-k+1
                for j=i:n/2-k+1
                    check=G(X(i))+G(Y(j))-2.*E1(X(i),Y(j));
                    if check>max
                        max=check;
                        a=X(i);
                        b=Y(j);
                    end
                end
            end

            X1=X;
            Y1=Y;


            av(k)=a;
            bv(k)=b;
    %         X=zeros(n/2-k-1);
    %         Y=zeros(n/2-k-1);
            s=1;
            l=1;
            for i=1:n/2-k+1
                if X1(i)~=a
                    X2(s)=X1(i);
                    s=s+1;
                end
                if Y1(i)~=b
                    Y2(l)=Y1(i);
                    l=l+1;
                end
            end

            clear X;
            clear Y;

            for i=1:s-1
                X(i)=0;
                Y(i)=0;
            end

            for m=1:s-1
                X(m)=X2(m);
            end
            for m=1:s-1
                Y(m)=Y2(m);
            end


            gv(k)=max;
            for i=1:n/2-k
                G(X(i))=G(X(i))+2.*(E1(X(i),a)-E1(X(i),b));
            end
            for i=1:n/2-k
                G(Y(i))=G(Y(i))+2.*(E1(Y(i),b)-E1(Y(i),a));
            end


        end

        gmax=0;
        check=0;
        for k=1:n/2
            check=check+gv(k);
            if check>gmax
                gmax=check;
                kmax=k;
            end
        end

       % gmax
        if gmax>0
            [av,bv]=exchange(av,bv,kmax);
        end
        for i=1:n/2
            V(i)=av(i);
            V(i+n/2)=bv(i);
        end
      %  V
      q = double(V);
      indices = sub2ind([n,n],q,[q(2:n),q(1)]);
      lnew= sum(E1(indices));
    %  Lnew=[Lnew lnew];
      if(lnew<cost)
          Vbest=V;
          cost=lnew;
      end
      hold off;
      x=O(V,2);
      y=O(V,3);
      plot(x,y,'-o','MarkerSize',2);
      xlabel(['Iterations = ',num2str(iterations),'cost = ',num2str(lnew)])
      drawnow;
      iterations=iterations+1;                                                        
    end  
    Vbest
    cost
end