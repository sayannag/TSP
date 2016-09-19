function [av,bv]=exchange(av,bv,kmax)
    for i=1:kmax
        temp=av(i);
        av(i)=bv(i);
        bv(i)=temp;
    end
end