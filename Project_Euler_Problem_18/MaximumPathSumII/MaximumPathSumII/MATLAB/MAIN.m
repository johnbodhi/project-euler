clear all; close all; clc; tic;

% NEXPSPACE-TIME MARKOV DECISION PROCESS

[RA,RAF,RS,RSF,N] = trellis();     

% Compute =optimum fold value... FN

Z = diag(flip(pascal(N),1)); Z = Z(1:ceil(N/2));

% EMAX = log(sum(Z(1:ceil(N/2))))/log(2); % T = sym(2^EMAX);

K = 1; P = 0;

F = [ -1 10000 ];

for Q = ceil(N/2):-1:1 

    if( Q < ceil(N/2) )
        
        break
    end

    while( P < Z(Q) ) 

        B(1,:) = permn([0;1],N,K); K = K + 1;
    
        % B(2,:) = permn([0 1], N, T ); T = T - 1;
    
        % B(3,:) = montecarlo(N,EMAX);

        if ( sum(B(1,:)) == Q )

            P = P + 1;
        end
    
        if ( sum(B(1,:)) < ceil(N/2) )
    
            [ F ] = pAdicDT( N, F, B, RA, RAF, RS, RSF );
        end

    end
    P = 0;
end

toc;