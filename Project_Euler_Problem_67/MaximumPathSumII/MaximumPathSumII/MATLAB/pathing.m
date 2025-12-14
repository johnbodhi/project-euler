function [Z_,Q_,K_,P_,EMAX_,F_] = pathing(R_)

    N_     = size(R_,1)               ;

    Z_     = diag(flip(pascal(N_),1)) ; 

    Z_     = Z_(1:ceil(N_/2))         ;

    EMAX_  = log(sum(Z_))/log(2)      ;

    K_     = 0                        ; 
    
    P_     = 0                        ;

    F_     = [ -1 10000 ]             ;