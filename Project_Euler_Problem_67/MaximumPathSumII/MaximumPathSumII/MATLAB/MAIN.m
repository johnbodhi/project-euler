clear all; close all; clc; tic;

% NEXPSPACE-TIME MARKOV DECISION PROCESS

[N,R]      = trellis() ;

[Z,Q,EMAX] = pathing(N);

F = [ -1 10000 ]; K = 1; P = 0;

while( P < Z(Q) )

    [B,K] = directives(N,K,EMAX);

    if (sum(B(1,:)) == Q-1)

        P = P + 1;
    end

    if (sum(B(1,:)) < Q)

        [F] = pAdicDT(N,F,B,L);
    end
end
toc;