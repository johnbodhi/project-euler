function [ F_, OPT_ ] = optimize( R_ )

    [  ]                       = parameterize(R_)                 ;

    [N_,Z_,Q_,K_,P_,EMAX_,F_]  = pathing(R_)                      ;

    while( P_ < Z_(Q_) )
    
        [B_,K_]                = directives(N_,Q_,EMAX_,K_)       ;
    
        if ( sum(B_(1,:)) == Q_-1 )
    
            P_                 = P_ + 1                           ;
        end

        if ( sum(B_(1,:)) < Q_ )
    
            [F_,OPT_]          = pAdicSpace(F_,B_,R_)             ;
        end
    end
    
end