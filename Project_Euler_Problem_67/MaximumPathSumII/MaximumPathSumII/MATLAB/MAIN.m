clear all; close all; clc; tic;

% NEXPSPACE-TIME MARKOV DECISION PROCESS

[RA,RAF,RS,RSF,N] = trellis();

Z = diag(flip(pascal(N),1)); 

Z = ceil(Z(1:ceil(N/2))./2);

[~,Q] = max(Z);

% EMAX = log(sum(Z(1:ceil(N/2))))/log(2); % T = sym(2^EMAX); We need to
% index the Q series, not the path number...

K = 1; P = 0;

F = [ -1 10000 ];

while( P < ceil(Z(Q)) )

    B(1,:) = permn([0;1],N,K); 

    B(2,:) = flip(B(1,:),2)  ; K = K + 1;

    % B(2,:) = permn([0;1], N, T ); T = T - 1;

    % B(3,:) = montecarlo(N,EMAX);

    % B(4,:) = DNN(); Convolve, and compliment...

    if ( sum(B(1,:)) == Q )

        P = P + 1;
    end

    if (sum(B(1,:)) < ceil(N/2))

        [F] = pAdicDT(N,F,B,RA,RAF,RS,RSF); 
    end
end
toc;