clear all; close all; clc; tic;

% NEXPSPACE-TIME MDP

[ NEXPSPACE ] = trellis();

Z    = ceil(diag(flip(pascal(N),2))./2); % How many divisions of Z? Z/nZ
  
Z    = Z(1:ceil(N/2));

EMAX = log(sum(Z))/log(2); 

K = 0; % T = sym(2^EMAX); P = 0;

% MOD = 1;

F = [ -1 10000 ];

for Q = ceil(N/2):-1:1

    % [ ~, B, STL, STU, SP ] = allocate( N, Q, MOD );
    
    while( P < Z(Q) )
    
        B(1,:)                     = permn([0;1],N-1,2^K); K = K + 1;

        % B(1,:)                   = permn([0;1],N-1,K); K = K + 1;

        % B(2,:)                   = monteCarlo(N,EMAX);

        % [ B(3,:), STL, STU, SP ] = DNN( N, Q, B, STL, STU, SP );

        % B(4,:)                   = permn([0;1],N-1,T); T = T - 1; % Slow...
    
        if( K == sum( Z ) + 1  )

            break
        end

        if( sum(B(1,:)) == Q-1 )
    
            P = P + 1;
        end

        if( sum(B(1,:)) < Q )
    
            [ F ] = pAdicDT( N, F, B, NEXPSPACE );
        end

    end
    P = 0;

    if( K == sum( Z ) + 1 )

        break
    end
end
toc;