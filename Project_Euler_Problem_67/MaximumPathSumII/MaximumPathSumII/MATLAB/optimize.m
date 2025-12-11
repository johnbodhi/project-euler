function [F_,OPT_] = optimize(R_)

    [N_,Z_,Q_,K_,EMAX_,P_,F_]  = pathing   (R_)                     ;

    while( P_ < ceil(Z_(Q_)) ) 
    
        [A_,B_,K_,H_,P_]       = directives(N_,Q_,K_,EMAX_,P_,A_)   ;
    
        if ( H_ < Q_ )
    
            [F_,OPT_]          = pAdicSpace(A_,B_,R_,F_)            ;
        end
    end    