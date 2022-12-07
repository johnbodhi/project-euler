clear all; close all; clc; tic

% We can read in a triangle from a file, or generate a triangle of arbitrary
% size to find a path from the top to bottom which yields a maximum sum for
% any lower trianglular matrix containing random numbers...
 
% A = [ 3 0 0 0; 7 4 0 0; 2 4 6 0; 8 5 9 3] ;
A = readmatrix("triangle_small.csv"); 
% A = csvread("triangle_large.csv"); 

% N = 15; M = N; 
% 
% A = zeros( N, M);
% 
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

N = 111111111; M = 123456789; ii = 1;
for i = N:1:M
    S(ii,1) = i; ii = ii + 1;
end

D = zeros(1,floor(log10(M-N)+1));

ii = 1; uu = 0; vv = 1;
for i = 1:1:(M-N)

    R = S(i,1);

    for j = 1:1:floor(log10(S(i))+1)

        D(i,j) = R - floor( R / 10 ) * 10;

        R = floor(R / 10);
    end

    X = size(find(D(i,:)),2);

    if( X == size(D,2) )
        
        F(ii,:) = D(i,:);
       
        jj = 2;
        while( jj <= size(D,2) )
    
            if( F(ii,jj) == F(ii,jj-1) || F(ii,jj) == F(ii,jj-1) - 1 )
                uu = uu + 1;
            end
            jj = jj + 1;
        end        

        if( uu == size(D,2) - 1 )
            FF(vv,:) = F(ii,:); vv = vv + 1;
        end
        uu = 0;
        ii = ii + 1;
    end   
end
FF = flip(FF,2);

K = FF;

L = zeros( size( K, 1 ), size(A,2) ); 

ii = 1;
while( ii <= size( K,1) )     
    
    L( ii, 1:size(K,2) ) = K( ii, 1:size(K,2) );   

    for j = size(K,2)+1:1:size(A,2)

        [ U( 1, 1 ), ~, ~ ] = find( I( :, j ) == L( ii, j - 1 ) );
        [ U( 1, 2 ), ~, ~ ] = find( I( :, j ) == L( ii, j - 1 ) + 1 );
        
        if( A( U( 1, 1 ), j ) >= A( U( 1, 2 ), j ) )     
             
            L( ii, j ) = I( U( 1, 1 ), j ); 
           
        elseif ( A( U( 1, 2 ), j ) >= A( U( 1, 1 ), j ) ) 
          
            L( ii, j ) = I( U( 1, 2 ), j );    
        end
    end    
    ii = ii + 1;
end
toc

S = zeros(size(L,1),1);

for i = 1:1:size(L,1)
    for j = 1:1:size(L,2)
        
        S(i,1) = S(i,1) + A(L(i,j),j);
    end
end
B = max(S);
