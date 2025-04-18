clear all; close all; clc; tic;

N = 100;

[ RA, RS ] = trellis(); 

Z = diag(flip(pascal(N),2));

EMAX = log(sum(Z(1:ceil(N/2)))) / log( 2 ); % T = sym(2^EMAX);

K = 1; P = 0;

for Q = ceil(N/2):-1:1

    A = 1;

    while( P < Z(Q) )
    
        B(1,:) = permn([0;1],N-1,K); K = K + 1;

        B(2,:) = monteCarlo(N,EMAX);

        % B(3,:) = permn([1;0],N-1,T); T = T - 1; % Slow...  
    
        if( K == sum(Z(1:ceil(N/2))) )
    
            break;
        end

        if( sum(B(1,:)) == Q-1 )
    
            P = P + 1;
        end       

        if( sum(B(1,:)) < ceil(N/2) && sum(B(2,:)) < ceil(N/2) )
    
            [ S_ ] = pAdicDT( N, B, RA, RS );
        end
        [ H_ ] = sol( S_ );
    
    end
    P = 0;

    if( K == sum(Z(1:ceil(N/2))) )

        break;
    end

end
toc;

