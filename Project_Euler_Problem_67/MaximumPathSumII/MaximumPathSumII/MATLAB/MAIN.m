clear all; close all; clc; tic;

N = 100;

Z = diag(flip(pascal(N),2));

EMAX = log(Z(ceil(N/2)))/log(2);

[ RA, RS ] = trellis(); P = 0; K_ = 1;

for Q = 1:1:ceil(N/2)

    while( P < Z(Q) )
    
        [ V, B, K, P, G, EXIT ] = genFun( N, Q, K_, P, EMAX );

        if(EXIT) 

            break;
        end
    
        S = dT( N, V, RA, RS   );

    end
    P = 0;
end   

toc