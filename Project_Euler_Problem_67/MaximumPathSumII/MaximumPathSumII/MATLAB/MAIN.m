clear all; close all; clc; tic;

% NEXPSPACE-TIME MDP

[ NEXPSPACE, N ] = trellis(); 

F = [ -1 10000 ];

for K = 0:1:N-2
    
    B(:)  = permn([0;1],N-1,2^K+1); 
    
    [ F ] = pAdicDT( N, F, B, NEXPSPACE );
end

toc;