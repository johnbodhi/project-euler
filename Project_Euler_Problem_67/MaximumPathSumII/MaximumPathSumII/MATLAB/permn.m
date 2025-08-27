function [ M, I ] = permn( V, N, K )

    nV = numel(V) ;

    % B  = nV.^(0:-1:1-N); 
    B  = nV.^(1-N:1:0) ; 

    I  = ((K(:)-.5) * B);
    I  = rem(floor(I), nV) + 1;
    
    M  = V(I) ;