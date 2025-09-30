function [Z_,Q_,EMAX_] = pathing(R_)

    N_     = size(R_,1)               ;

    Z_     = diag(flip(pascal(N_),1)) ; 

    Z_     = Z_(1:ceil(N_/2))         ;

    [~,Q_] = max(Z_)                  ;

    EMAX_  = log(sum(Z_))/log(2)      ;
   