clear all; close all; clc; tic

global N

% N = 100;

S  = zeros(1,2);
SS = zeros(1,2);

[ RA, RS ] = trellis();

for Q = 1:1:ceil(N/2)
    
    [ B, V, K ] = genFun( Q, K );

    S(1) = dT( B, RA, RS, Q );

    S(2) = dTa( V, RA, RS, Q, K );

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
H = max(SS); toc;