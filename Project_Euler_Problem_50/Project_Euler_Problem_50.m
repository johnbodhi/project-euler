clc; clear all; close all;

A = csvread("primesUnderOneMil.csv");

L = 1000000;jj = 1;

for j = 1:1000
    for i = 1:j    
        B = sum( A( i:j ,1 ) );  
        if( B > L )
            break
        elseif( find( A == B ) )
            C( jj ) = B; jj = jj + 1;
        end   
    end
end
D = max(C);