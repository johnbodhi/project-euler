function [Z_,Q_,EMAX_] = pathing(N_)

    FN = 2;

    Z_ = diag(flip(pascal(N_),1)); 

    Z_ = ceil(Z_(1:ceil(N_/2))/FN);

    [~,Q_] = max(Z_);

    EMAX_ = log(sum(Z_))/log(2);
   