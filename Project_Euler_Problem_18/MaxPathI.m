clear all; close all; clc; tic

% We can read in a triangle froma file, or generate a triangle of arbitrary
% size to find a path from the top to bottom which yields a maximum sum for
% any lower trianglular matrix containing random numbers...
 
% A = [ 3 0 0 0; 7 4 0 0; 2 4 6 0; 8 5 9 3 ]; 
A = readmatrix("triangle_small.xlsx"); 
% A = csvread("triangle_large.csv"); 

% N = size(A,1); M = size(A,2);

% N = 200; M = N;
% 
% for j = 1:M
%     for i = 1:N
%         if( i < j || i == j)
%             A( i, j ) = randi( [ 10,99 ] );
%         end
%     end
% end

% Transpose matrix A to march through natrually.

A = A'; 

A = cat( 2, A, zeros( size( A, 1 ), 1 ) ); N = size(A,1); M = size(A,2);

I = zeros( N, M );

for j = 1:1:M

    [ A( :, j ), I( :, j ) ] = sort( A( :, j ), 'descend' );
end

for j = 1:1:M
    for i = 1:1:N
        if( i > j )

            I( i, j ) = 0;
        end
    end
end

L = zeros( 1, M ); L( 1, 1 ) = I( 1, 1 );

B = zeros( 1, 2 );

K = [ 1 1 1; 1 1 2; 1 2 2; 1 2 3 ]; U = zeros( 1, 2 );

R = zeros( size( K,1), 1 ); RR = zeros( 3, 1);

ii = 1;

while( ii <= size( K,1) )    
    
    L( 1, 1:size(K,2) ) = K( ii, 1:size(K,2) );   

    for j = 1:1:size( K, 2 )

        [ U( 1, 1 ), ~, ~ ] = find( I( :, j ) == L( 1, j ) );

        R( ii, 1 ) = R( ii, 1 ) + A( U( 1, 1 ), j );        
    end
   
    U = 0;

    for j = size(K,2)+1:1:M - 1

        if( ii <= size( K, 2) )
            [ U( 1, 1 ), ~, ~ ] = find( I( :, j ) == L( 1, j - 1 ) );
            [ U( 1, 2 ), ~, ~ ] = find( I( :, j ) == L( 1, j - 1 ) + 1 );
            [ U( 1, 3 ), ~, ~ ] = find( I( :, j ) == L( 1, j - 1 ) + 2 );
        else
            [ U( 1, 1 ), ~, ~ ] = find( I( :, j ) == L( 1, j - 1 ) );
            [ U( 1, 2 ), ~, ~ ] = find( I( :, j ) == L( 1, j - 1 ) + 1 );
            U( 1, 3 ) = U( 1, 1 );
        end

        if( A( U( 1, 1 ), j ) >= A( U( 1, 2 ), j ) )   

            RR( 1, 1 ) = A( U( 1, 1 ), j );
            
            L( 1, j ) = I( U( 1, 1 ), j );
        elseif ( A( U( 1, 2 ), j ) >= A( U( 1, 1 ), j ) )
            
            RR( 2, 1 ) = A( U( 1, 2 ), j );
            
            L( 1, j ) = I( U( 1, 2 ), j );
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        if( RR( 1, 1 ) > RR( 2, 1 ) )
        
            R( ii, 1 ) = R( ii, 1 ) + RR( 1, 1 ); 
            RR( 1, 1 ) = 0;
        else
        
            R( ii, 1 ) = R( ii, 1 ) + RR( 2, 1 ); 
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        if( A( U( 1, 1 ), j + 1 ) >= A( U( 1, 2 ), j + 1 ) && A( U( 1, 1 ), j + 1 ) >= A( U( 1, 3 ), j + 1 ) && L( 1, j ) == I( U( 1, 1 ), j + 1 ) )   
        
            RR( 1, 1 ) = A( U( 1, 1 ), j + 1);
            
            L( 1, j + 1) = I( U( 1, 1 ), j + 1);
        elseif ( A( U( 1, 2 ), j + 1 ) >= A( U( 1, 1 ), j + 1 ) && A( U( 1, 2 ), j + 1 ) >= A( U( 1, 3 ), j + 1 ) && L( 1, j ) == I( U( 1, 2 ), j + 1 ) )
        
            RR( 2, 1 ) = A( U( 1, 2 ), j + 1);
            
            L( 1, j + 1 ) = I( U( 1, 2 ), j + 1);
        elseif ( A( U( 1, 3 ), j + 1 ) >= A( U( 1, 1 ), j + 1 ) && A( U( 1, 3 ), j + 1 ) >= A( U( 1, 2 ), j + 1 ) && L( 1, j ) == I( U( 1, 3 ), j + 1 ) )
        
            RR( 3, 1 ) = A( U( 1, 3 ), j + 1);
            
            L( 1, j + 1) = I( U( 1, 3 ), j + 1);         
        end           

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        if( RR( 1, 1 ) > RR( 2, 1 ) && RR( 1, 1 ) > RR( 3, 1 ) )
        
            R( ii, 1 ) = R( ii, 1 ) + RR( 1, 1 ); 
            RR( 1, 1 ) = 0;
        elseif( RR( 2, 1 ) > RR( 1, 1 ) && RR( 2, 1 ) > RR( 3, 1 ) ) 
        
            R( ii, 1 ) = R( ii, 1 ) + RR( 2, 1 ); 
            RR( 2, 1 ) = 0;
        elseif( RR( 3, 1 ) > RR( 1, 1 ) && RR( 3, 1 ) > RR( 2, 1 )  )

            R( ii, 1 ) = R( ii, 1 ) + RR( 3, 1 ); 
            RR( 3, 1 ) = 0;
        end

    end  

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    B( 1, 2 ) = R( ii, 1 );
        
    if( B( 1, 2 ) > B( 1, 1 ) )
        B = circshift( B, -1, 2 ); 
        B( 1, 2 ) = 0;
    else        
        B( 1, 2 ) = 0;
    end      
    
    ii = ii + 1; L = zeros( 1, size(A,2) );
end

toc