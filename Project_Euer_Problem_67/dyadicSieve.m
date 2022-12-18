clear all; close all; clc; tic

% We can read in a triangle from a file, or generate a triangle of arbitrary
% size to find a path from the top to bottom which yields a maximum sum for
% any lower trianglular matrix containing random numbers...
 
% A = [ 3 0 0 0; 7 4 0 0; 2 4 6 0; 8 5 9 3];
A = readmatrix("triangle_small.csv"); 
% A = csvread("triangle_large.csv"); 

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

A = A';

I = zeros( size(A,1), size(A,2) );

for j = 1:1:size(A,2)
    for i = 1:1:size(A,1)

         I( i, j ) = i;

         if( i > j )
            I( i, j ) = 0;
        end
    end
end

N = 1111; M = 12345;

D = zeros(1,floor(log10(M)+1));

ii = 1; vv = 0; uu = 0;
for i = N:1:M

    R = i;

    for j = 1:1:floor(log10(R)+1)
            
        D(1,j) = R - floor( R / 10 ) * 10;

        R = floor( R / 10 );
    end

    X = size(find(D(1,:)),2);

    if( X == size(D,2) )
        
        F(1,:) = D(1,:);
       
        jj = 2;
        while( jj <= size(D,2) )
    
            if( F(1,jj) == F(1,jj-1) || F(1,jj) == F(1,jj-1) - 1 )
                uu = uu + 1;
            end
            jj = jj + 1;
        end        

        if( uu == size(D,2) - 1 )
            FF(ii,:) = F(1,:); 
            ii = ii + 1;
        end
        uu = 0;       
    end   
end
FF = flip(FF,2);

K = FF; toc