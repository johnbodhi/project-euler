clear all; close all; clc;

tic

A = vpi(2)^1000;
N = factorial(vpi(100)); 
M = double(floor( log10( N ) + 1 )); R = N;
D = zeros(M,1);

for i = 1:M  
    D( i ) = R -  floor( R / 10 ) * 10;
    R = floor( R / 10 );
end
S = sum(D)

M = double(floor( log10( A ) + 1 )); R = A;
D = zeros(M,1);

for i = 1:M  
    D( i ) = R -  floor( R / 10 ) * 10;
    R = floor( R / 10 );
end
S = sum(D)

toc
