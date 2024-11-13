clear all; close all; clc; tic

global ACCEL SUP

N = 15;

Z = diag(flip(pascal(N),2)); ACCEL = 1;

SUP = 1e3;

Vb = zeros(N-1,SUP,ceil(N/2)); Vb(:,1,:) = Inf;

S  = zeros(1,2);
SS = zeros(1,2);

[ RA, RS ] = trellis(); P = 0; K = 1;

for Q = 1:1:ceil(N/2)

    while( P < Z(Q) )
    
        [ B, Vb, K, P, G ] = genFun( N, Q, K, P, Vb );
    
        S(1) = dT( N, B, RA, RS, Q );
    
        if( ACCEL )
    
            S(2) = dTa( N, Vb, RA, RS );
        end
    
        if( S( 1 ) >= S( 2 ) )
    
            S( 2 ) = 0;
        elseif( S( 1 ) < S( 2 ) )
    
            S( 1 ) = S( 2 );
        end
    
        SS_( 2 ) = S( 1 );
    
        if( SS_( 1 ) >= SS_( 2 ) )
    
            SS_( 2 ) = 0;
        elseif( SS_( 1 ) < SS_( 2 ) )
    
            SS_( 1 ) = SS_( 2 );
        end
    end
    P = 0;

end   
H = max(SS); toc;