clear all; close all; clc; tic;

% NEXPSPACE-TIME MARKOV DECISION PROCESS

[ D, N ] = trellis(); 

F = [ -1 10000 ];

for k = 0:1:N
    
    B(:)  = permn([0;1],ceil((N-1)/2),1); 
    
    [ F ] = pAdicDT( N, F, B, D );
end

toc;