clear all; close all; clc; tic

A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_345\matrixSum.csv");

%{
N = 10; M = N;
for j = 1:M
    for i = 1:N

        A( i, j ) = randi( [ 100, 999 ] );
    end
end
%}










toc