clear all; close all; clc; tic;

N = 4;

Z = diag(flip(pascal(N),2));

EMAX = log(sum(Z(1:ceil(N/2))))/log(2);

[ RA, RS ] = trellis(); P = 0; K = 1; % T = sym(2^EMAX);

for Q = 1:1:ceil(N/2)

    while( P < Z(Q) )
    
        B(1,:) = permn([0;1],N-1,K); K = K + 1;
    
        if( K == sum(Z(1:ceil(N/2))) )
    
            break;
        end
    
        if( sum(B(1,:)) == Q-1 )
    
            P = P + 1;
        end

        % [ F, H, E ] = histogram(B(1,:), H, E_ );

        % [ D ] = CNN( F, H, E );
    
        % B(2,:) = permn([1;0],N-1,T); T = T - 1;
    
        B(2,:) = monteCarlo(N,EMAX);
    
        if( sum(B(1,:)) < ceil(N/2) && sum(B(2,:)) < ceil(N/2) )            
    
            S(2) = dT( N, B, RA, RS );
        end
            
        if( S(1) <= S(2) )
    
            S(1) = S(2); S(2) = 0;
            
        elseif( S(1) > S(2) )
        
            S(2) = 0;
        end
        H_ = S(1);
    
    end
    P = 0;

    if( K == sum(Z(1:ceil(N/2))) )
    
        break;
    end
end

toc;