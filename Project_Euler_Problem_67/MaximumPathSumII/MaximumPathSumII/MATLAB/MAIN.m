clear all; close all; clc; tic;

% NEXPSPACE-TIME MARKOV DECISION PROCESS

[N,L]      = trellis();

[Z,Q,EMAX] = pathing(N);

K = 1; P = 0;

F = [ -1 10000 ];

while( P < Z(Q) )

    B(1,:) = permn([0;1],N,K); K = K + 1;

    if ( sum(B(1,:)) == Q-1 )

        P = P + 1;
    end

    if (sum(B(1,:)) < Q )

        [F] = pAdicDT(N,F,B,L); 
    end
end
toc;