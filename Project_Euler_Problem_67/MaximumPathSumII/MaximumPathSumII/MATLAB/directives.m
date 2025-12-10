function [A_,K_]  = directives(N_,K_,EMAX_)

    M_            = floor(2^(K_-1)+1)                     ; 

    B_(1,:)       = permn([0;1],N_,M_)                    ; 

    B_(2,:)       = flip(B_(1,:),2)                       ;

    B_(3,:)       = permn([1;0,],N_,K_)                   ; 

    B_(4,:)       = flip(B_(3,:),2)                       ;

    K_            = K_ + 1                                ;    

    B_(5:8,:)     = monteCarlo(N_,EMAX_)                  ;
    
    B_            = DNN(B_,STL_,STU_,SP_,SPNC_,SPC_)      ;
