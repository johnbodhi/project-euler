 clear all; close all; clc; tic;

 F(1) = 1; F(2) = 1; 
 
 M = 0; ii = 0; jj = 2; kk = 1;
 
 A = zeros(1000,1); S = zeros(1000,1);

 while( M < 1000 )

    F(3) = F(2) + F(1);

    F(1) = F(2);

    F(2) = F(3); 
    
    M    = floor(log10(F(3))+1); 

    A(M) = A(M) + 1;

    F(3) = 0; 

    jj   = jj + 1;

 end

 toc