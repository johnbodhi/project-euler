sclc; clear all; close all;

A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv");
% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv"); 

N = size(A,1); M = size(A,2);

for k = N:-1:1
    for j = M:-1:1    
        
        L = A(N,j,k);
        
        for i = N:-1:1
            
            if ( i < N )
        
                A(i,j,k) = A(i,j,k);
            
            elseif ( i == N )
                
               A(i,j,k) = L;
            
            end 

        end 

    end    
end