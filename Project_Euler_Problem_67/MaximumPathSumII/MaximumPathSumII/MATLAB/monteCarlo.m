function [A_] = monteCarlo(N_,EMAX_)

    if( 2^EMAX_ <= 2^52 )

        K_       = randi([1,floor(2^EMAX_)])          ;
    else

        OPT      = floor(2^EMAX_/2^52)                ;
        
        K_       = randi([1,OPT] )*randi([1,2^52])    ;
    end
    B_(1,:)      = permn([0;1],N_,K_)                 ;

    B_(2,:)      = flip(B_(1,:),2)                    ;

    B_(3,:)      = permn([1;0,],N_,K_)                ; 

    B_(4,:)      = flip(B_(3,:),2)                    ;

    for I_ = 1:1:size(B_,1)

        A_(I_,:) = B_(I_,:)                          ;
    end