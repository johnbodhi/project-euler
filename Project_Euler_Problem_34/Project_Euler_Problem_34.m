clear all; close all; clc

tic

N = 100000;

D = zeros(N,1); M = zeros(N,1); S = zeros(N,1); G = zeros(N,1);V = zeros(N,1);

for i = 3:N
    
    D(i) = i; M= double( floor( log10( D( i ) ) + 1 ) );
    
    R = D(i); Z = zeros(size(M,1),1); F = zeros(size(M,1),1);
    
    for j = 1:M   
        Z(j) = R - floor(R / 10)*10;        
        R = R / 10;            
    end
    
    for j = 1:M
        F(j) = factorial( real(floor(Z( j ))) );
    end
    
    S(i) = sum(F);    
    
    if (S(i) == D(i))        
        G(i) = D(i);
    end 
    
    F = 0; S = 0; Z = 0;         
end 

X = find(G); C = sum(G);

toc



