clc; clear all; close all;

A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv");
% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv"); 

N = size(A,1); M = size(A,2);

for k = 1:1:N
    for j = 1:1:M    
        
        L = A(N,j,k);
        
        for i = 1:1:N
            
            if ( i < N )
        
                A(i,j,k) = A(i,j,k);
            
            elseif ( i == N )
                
               A(i,j,k) = L;
            
            end 

        end 
        
    end    
end