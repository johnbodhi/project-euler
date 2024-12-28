clear all; close all; clc; tic;

N = 100;

Z = diag(flip(pascal(N),2));

EMAX = log(sum(Z(1:ceil(N/2))))/log(2);

[ RA, RS ] = trellis(); P = 0; K = 1; % T = sym(2^EMAX);

for Q = ceil(N/2):-1:1

    A = 1;

    while( P < Z(Q) )
    
        B(1,:) = permn([0;1],N-1,K); K = K + 1;
    
        if( K == sum(Z(1:ceil(N/2))) )
    
            break;
        end
    
        if( sum(B(1,:)) == Q-1 )
    
            P = P + 1;
        end
    
        % B(2,:) = permn([1;0],N-1,T); T = T - 1;
    
        B(2,:) = monteCarlo(N,EMAX);

        if ( A )

           [ F ] = allocate( B ); A = 0;
        end

        [ F ] = histogram( B, F, K );

        if( sum(B(1,:)) < ceil(N/2) && sum(B(2,:)) < ceil(N/2) )
    
            S_(2) = dT( N, B, RA, RS );
        end
        
        [ H_, S_ ] = sol( S_ );
    
    end
    P = 0;

    if( K == sum(Z(1:ceil(N/2))) )
    
        break;
    end
end

toc;