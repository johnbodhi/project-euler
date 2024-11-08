clear all; close all; clc; tic

global N

[ RA, RS ] = trellis();

S  = zeros(1,2);
SS = zeros(1,2);

for Q = 0:1:ceil(N/2)-1
        
    [ B, V ] = genFun( Q );

    S(1) = dT(  B, RA, RS, Q );

    if( V )

        S(2) = dTa( V, RA, RS, Q );
    end
    
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

end
H = max(SS); toc;