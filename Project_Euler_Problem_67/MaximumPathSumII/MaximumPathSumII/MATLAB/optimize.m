function [F_ OPT_] = optimize(R_)

    [R_]                       = parameterize(R_)                 ;

    [N_,Z_,Q_,K_,P_,EMAX_,F_]  = pathing(R_)                      ;

    while( P_ < ceil(Z_(Q_)/2) )
    
        [B_,K_]                = directives(N_,Q_,K_EMAX_)        ;
    
        if ( sum(B_(1,:)) == Q_-1 )
    
            P_                 = P_ + 1                           ;
        end
        
        for i = 1:1:size(A_,1)
    
            G_(i,1) = sum(A_(i,:),2);
        end
        H_ = max(G_);

        if ( sum(B_(1,:)) < Q_ )
    
            [F_,OPT_]          = pAdicSpace(F_,B_,R_)             ;
        end
    end
    
end