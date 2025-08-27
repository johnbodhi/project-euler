function [ M, I ] = permn( V, N, K )

    nV = numel(V) ;

    B  = nV.^(0:-1:1-N); 

    I  = ((K(:)-.5) * B);
    I  = rem(floor(I), nV) + 1;
    
    M  = V(I) ;