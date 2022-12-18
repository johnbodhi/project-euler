clear all; close all; clc;

% A = readmatrix("triangle_small.csv"); 
A = readmatrix("triangle_large.csv"); 

B = zeros(1,1);
ii = 1;
for j = 1:1:15
    for i = 1:1:15

        B(ii,1) = A(i,j); ii = ii + 1;
    end
end
