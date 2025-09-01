function [B_,K_] = directives(N_,K_)

    B_(1,:)   = permn([0;1],N_,K_); K_ = K_ + 1;

    B_(2,:)   = flip(B_(1,:),2) ;

    % B(3:4,:) = monteCarlo();
    % 
    % B(5:6,:) = DNN();