clear all; close all; clc; tic;

[ RA, RS, RAF, RSF, N ] = trellis(); % Can we extend Q outcomes to segmented higher modulus folds? 

% Fold half of half etc... Overlap lower value directive with higher valued
% directives in the same leaf? p-adic directives and p-adic directed geometry!

Z    = ceil(diag(flip(pascal(N),2))./2); 
  
Z    = Z(1:ceil(N/2));

EMAX = log(sum(Z))/log(2); 

K = 1; % T = sym(2^EMAX); P = 0;

F = [ -1 10000 ];

for Q = ceil(N/2):-1:1

    [ ~, B, STL, STU, SP ] = allocate( Q, N, MOD );
    
    while( P < Z(Q) )
    
        B(1,:) = permn([0;1],N-1,K); K = K + 1;

        B(2,:) = monteCarlo(N,EMAX);

        [ B, STL, STU, SP ] = DNN( N, Q, B, STL, STU, SP );


        % B(4,:) = permn([0;1],N-1,T); T = T - 1; % Slow...
    
        if( K == sum( Z ) + 1  )

            break
        end

        if( sum(B(1,:)) == Q-1 )
    
            P = P + 1;
        end

        if( sum(B(1,:)) < Q && sum(B(2,:)) < Q && sum(B(3,:)) < Q && sum(B(4,:)) < Q )
    
            [ F ] = pAdicDT( N, B, RA, RS, RAF, RSF, F );
        end

    end
    P = 0;

    if( K == sum( Z ) + 1 )

        break
    end
end

toc;