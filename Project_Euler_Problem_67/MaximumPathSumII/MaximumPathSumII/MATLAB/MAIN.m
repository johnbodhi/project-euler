clear all; close all; clc; tic

global N

[ RA, RS ] = trellis();

Z = diag(flip(pascal(N),2));

S  = zeros(1,2);
SS = zeros(1,2);

Q = 0; P = 0; K = 1;

for U = 1:1:ceil(N/2)

    while( P < Z(U) )
        
        [ B, V ] = genFun( Q, U, K );

        S(1) = dT(  B, RA, RS, Q );

        S(2) = dTa( V, RA, RS, Q );
        
        % if( S( 1 ) >= S( 2 ) )
        % 
        %     S( 2 ) = 0;
        % elseif( S( 1 ) < S( 2 ) )
        % 
        %     S( 1 ) = S( 2 );
        % end
        % 
        % SS_( 2 ) = S( 1 );
        % 
        % if( SS_( 1 ) >= SS_( 2 ) )
        % 
        %     SS_( 2 ) = 0;
        % elseif( SS_( 1 ) < SS_( 2 ) )
        % 
        %     SS_( 1 ) = SS_( 2 );
        % end

        P = P + 1; K = K + 1;
    end
    Q = Q + 1; P = 0; K = 1;

end
H = max(SS); toc;