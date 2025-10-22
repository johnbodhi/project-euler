clear all; close all; clc; tic;

N = 3; M = 3;

VAR = 2;

MUL = N*M;

UB = VAR^MUL;

ii = 1;

%for i = 1:1:ceil(MUL/2)
    
    % F(i,1) = nchoosek(MUL,i);
%end

k = 1;
while( k <= UB )
    
    V = permn([0 1], MUL, k);
    
    if( sum(V,2) <= ceil( MUL / 2 ) )
        
        B(ii,:) = V; ii = ii + 1;
    end  
    
    V;
    
    k = k + 1;
end

toc;