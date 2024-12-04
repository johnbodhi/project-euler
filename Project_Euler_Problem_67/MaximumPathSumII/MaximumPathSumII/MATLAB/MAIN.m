clear all; close all; clc; tic

N = 100;

Z = diag(flip(pascal(N),2));

EMAX = log(Z(ceil(N/2)))/log(2);

S  = zeros(1,3);
SS = zeros(1,2);

[ RA, RS ] = trellis(); P = 0; 

Kf = 1; Kb = Z(ciel(N/2));

for Q = 1:1:ceil(N/2)

    while( P < Z(Q) )
    
        [ V, B, K, P, G, EXIT ] = genFun( N, Q, Kf, Kb, P, EMAX );

        if(EXIT) 

            break;
        end
    
        S(1) = dT( N, B, RA, RS, Q );
    
        S(2) = dTa( N, V, RA, RS   );
    
        if( S( 1 ) >= S( 2 ) )

            S( 2 ) = 0;
        elseif( S( 1 ) < S( 2 ) )

            S( 1 ) = S( 2 );
        end

        SS( 2 ) = S( 1 );

        if( SS( 1 ) >= SS( 2 ) )

            SS( 2 ) = 0;
        elseif( SS( 1 ) < SS( 2 ) )

            SS( 1 ) = SS( 2 );
        end

    end
    P = 0;
end   
H = max(SS); toc