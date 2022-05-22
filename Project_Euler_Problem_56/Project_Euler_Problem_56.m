clear all; close all; clc

tic

D = zeros(200,10000); S = zeros(10000,1);Q = 1;

for i = 99:99
    for j = 1:99
        
        a = vpi(i);
        b = j;
        c = a^b;
        
        M = double( floor( log10( c ) + 1 ) );
        R = c;
        for k = 1:M
            D(k,Q) = R - floor(R / 10) * 10;
            R = R / 10;            
        end    
        Q = Q + 1;
    end    
end

for j = 1:size(D,2)
    S(j) = sum(D(:,j));
end

MAX = max(S)

toc
