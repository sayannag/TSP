function a=acceptance_probability(olddist,newdist,T)
    a=exp((olddist-newdist)/T);
    if newdist<olddist
        a=1.0
    end
end