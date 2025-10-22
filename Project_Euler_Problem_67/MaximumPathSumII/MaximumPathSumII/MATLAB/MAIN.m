clear all; close all; clc; tic;

% EXPSPACE-TIME MARKOV DECISION PROCESS

[R]         = expSpace()             ;

[Z,Q,K,P,F] = pathing(R)             ;

while( P < Z(Q) )

    [B,K]   = directives(K)          ;

    if ( sum(B(1,:)) == Q-1 )

        P   = P + 1                  ;
    end

    if ( sum(B(1,:)) < Q )

        [F] = pAdicSpace(F,B,R)      ;
    end
end
toc                                  ;