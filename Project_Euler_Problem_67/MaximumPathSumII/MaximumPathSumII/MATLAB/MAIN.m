clear all; close all; clc;

N = 100;

Z = diag(flip(pascal(N),2));

EMAX = log(Z(ceil(N/2)))/log(2);

[ RA, RS ] = trellis(); P = 0; K = 1;

for Q = 1:1:ceil(N/2)

    while( P < Z(Q) )

        B(1,:) = permn([0;1],N-1,K); K = K + 1;

        if( sum(B(1,:),2) == Q-1 )

            P = P + 1;
        end

        B(2,:) = monteCarlo(N,EMAX);

        if( sum(B(1,:),2) < ceil(N/2) &&...
            sum(B(2,:),2) < ceil(N/2) )

            S(2) = dT( N, B, RA, RS );

        elseif( sum(B(1,:),2) < ceil(N/2) &&...
                sum(B(2,:),2) >= ceil(N/2) )
            
            S(2) = dT( N, B(1,:), RA, RS );

        elseif( sum(B(1,:),2) >= ceil(N/2) &&...
                sum(B(2,:),2) < ceil(N/2)  )
            
            S(2) = dT( N, B(2,:), RA, RS );

        end
            
        if( S(1) <= S(2) )

            S(1) = S(2); S(2) = 0;
            
        elseif( S(1) > S(2) )
        
            S(2) = 0;
        end
        H_ = S(1);
        
    end
    P = 0;

end