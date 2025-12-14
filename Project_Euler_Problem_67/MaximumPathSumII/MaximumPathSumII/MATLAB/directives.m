function [A_,B_,K_,H_,P_,F_]  = directives(A_,N_,Q_,K_,P_,EMAX_)

    M_            = floor(2^(K_-1)+1)                                              ; 

    B_(1,:)       = permn([0;1],N_,M_)                                             ; 

    B_(2,:)       = flip(B_(1,:),2)                                                ;

    B_(3,:)       = permn([1;0,],N_,K_)                                            ; 

    B_(4,:)       = flip(B_(3,:),2)                                                ;

    K_            = K_ + 1                                                         ;    

    B_(5:8)       = monteCarlo(N_,EMAX_)                                           ;

    if ( P_ <= 1 )
        
        [A_,STL_,STU_,SP_,SPNC_,SPC_,F_] = allocate(N_,Q_)                         ;
    end
    
    [B_,STL_,STU_,SP_,SPNC_,SPC_] = DNN(B_,STL_,STU_,SP_,SPNC_,SPC_)        

    for I_ = 1:1:size(A_,1)
    
        G_(I_)    = sum(A_(I_,:),2)                                                ;
    end
    H_ = max(G_)                                                                   ;

    if ( H_ <= Q_-1 )
    
        P_        = P_ + 1                                                         ;
    end