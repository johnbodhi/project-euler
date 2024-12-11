clear all; close all; clc; tic;

N = 100;

Z = diag(flip(pascal(N),2));

[ RA, RS ] = trellis(); P = 0; K = 1;

for Q = 1:1:ceil(N/2)

    while( P < Z(Q) )

        B = permn([0;1],N-1,K); K = K + 1;

        if( K == sum(Z(1:ceil(N/2))) )
    
            break;
        end

        if( sum(B) == Q-1 )

            P = P + 1;
        end

        if( sum(B) < ceil(N/2) )            

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