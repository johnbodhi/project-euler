clear all; close all; clc; tic;

% EXPSPACE-TIME MARKOV DECISION PROCESS

[R]     = expSpace();

[Z,Q]   = pathing(R);

F       = [ -1 10000 ]; 

K = 1; P = 0;

while( P < Z(Q) )

    [B,K] = directives(K);

    if ( sum(B(1,:)) == Q-1 )

        P = P + 1;
    end

    if ( sum(B(1,:)) < Q )

        [F] = pAdicDT(F,B,R);
    end
end
toc;