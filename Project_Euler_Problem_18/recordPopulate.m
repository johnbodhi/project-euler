clear all; close all; clc;

A = readmatrix("triangle_small.csv"); 
% A = readmatrix("triangle_large.csv"); 

% N = 15; M = N; 
% A = zeros( N, M);

% for j = 1:M
%     for i = 1:N
%         if( i <= j )
%             % A( i, j ) = 1;
%             % A( i, j ) = randi( [ 1,10 ] );
%         end
%     end
% end

B = zeros(1,1);
ii = 1;
for j = 1:1:size(A,2)
    for i = 1:1:size(A,1)

        B(ii,1) = A(i,j); 
        if( isnan(B(ii,1)) )
            B(ii,1) = 0;
        end
        ii = ii + 1;
    end
end

writematrix(B,'triangle_large2.txt')