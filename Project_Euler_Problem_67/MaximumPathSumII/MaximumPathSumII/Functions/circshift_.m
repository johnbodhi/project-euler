clc; clear all; close all;

A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv");
% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv"); 

N = size(A,1); M = size(A,2);

A(:,:,2) = A(:,:,1);
for k = 2:1:N

    A(:,:,k) = A(:,:,1); 
end

O = size(A,3); 

R = 4;

for l = 1:1:R
    for k = 1:1:O
        for j = 1:1:M
            
            L1 = A(1,j,k);
            LN = A(N,j,k);
         
            for i = N:-1:1

                if ( i < N && i > 1 )
            
                    A(i+1,j,k) = A(i,j,k);
                
                elseif ( i == 1 )
                    
                   A(i,j,k)   = LN;

                   A(i+1,j,k) = L1;
                
                end 
    
            end
        end
    end
end