function [B_,K_] = directives(K_)

    M_          = floor(2^(K_-1)+1) ; K_ = K_ + 1;

    B_(1,:)     = permn([0;1],N_,M_); 

    % B_(1,:)     = permn([0;1],N_,K_); K_ = K_ + 1;
    
    B_(2,:)     = flip(B_(1,:),2)   ;

    % B_(3,:)   = monteCarlo(N_,EMAX_);
    
    % B_(5:6,:) = DNN( )              ;