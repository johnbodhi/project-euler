clear all; close all; clc; tic

% We can read in a triangle froma file, or generate a triangle of arbitrary
% size to find a path from the top to bottom which yields a maximum sum for
% any lowwr trianglular matrix containing random numbers...

%A = [ 3 0 0 0; 7 4 0 0; 2 4 6 0; 8 5 9 3 ]; 
A = readmatrix("triangle_small.csv"); 
% A = csvread("triangle_large.csv"); 
 
N = size(A,1); M = size(A,2);

% N = 1000; M = N;
% for j = 1:M
%     for i = 1:N
%         if( i < j || i == j)
% 
%             A( i, j ) = randi( [ 10,99 ] );
%         end
%     end
% end
% A = A';

% Flip matrix A to take take advantage of symmetry.

AS = zeros(size(A,1),size(A,2));
for i = 1:1:size(A,1)

    AS(i,1:i) = flip(A(i,1:i),2);
end

% Transpose matrix A to march through natrually.

A  = A';
AS = AS';

% Generate 3-D storage of all branch subspaces within decision constraint. 

D = zeros( size(A,1), size(A,2), size(A,1) ); kk = 1;

for k = size( D, 3 ):-1:1
    for j = 1:1:size( D, 2 )
        for i = 1:1:size( D, 1 )               
            
            if( k == size(D,3) )
                cc = 0;
                for j = 1:size(D,2)
                    for i = 1:size(D,1)
                        if( i == j )
                            D( k - cc, j, k ) = k - cc;
                            cc = cc + 1;
                        end
                    end
                end

            elseif( k < size(D,2) || k > 1 )

                hh = size(D,2) - k + 1; 
                dd = 1;
                for p = k:-1:1
                    D( p, dd:hh, k ) = p;
                    dd = dd + 1;
                    hh = hh + 1; 
                end                

            elseif( k == 1 )
                    
                for j = 1:size(D,2)
                    for i = 1:size(D,1)
                        if( i == size(D,1) )
                            D( size(D,1), j, k ) = k;
                        end
                    end
                end
                
            end
        end
    end
end

% Re-assign all true values in matrix A associated with the Trellis 
% indexes to matrix R.

D = flip(D,2);
for k = 1:size(D,3)
    for j = 1:size(D,2)
        for i = 1:size(D,1)
            if( D( i, j, k ) )

                RA( i, j, k ) = A( D( i, j, k ), j );
                RS( i, j, k ) = AS( D( i, j, k ), j );
            end            
        end
    end
end

% We want to march through the first half of the triangle, and it's
% reflection to minimize the search for eigenvectors that define the 
% paths through the dyadic tree.

if( mod(N,2) ~= 0 )

    R = cat(3,RA(:,:,1:floor(N/2)+1),RS(:,:,1:floor(N/2)));
    R(:,:,floor(N/2)+2:N) = flip(R(:,:,floor(N/2)+2:N),3);
else

    R = cat(3,RA(:,:,1:floor(N/2)),RS(:,:,1:floor(N/2)));
    R(:,:,floor(N/2)+1:N) = flip(R(:,:,floor(N/2)+1:N),3);
end
D = flip(D,2); R = flip(R,2);

R = circshift(R,1,1);

% Find all legal paths through the Trellis.

Z = diag( flip( pascal( size( A, 1 ) ), 2 ) ); % Number of paths through the triangle from each bottom index.

SS = zeros(1,2);

for i = 1:1:size(Z,1)
    
    for k = 1:1:size(R,1)

        if( R( k, 1, i ) )
            ii_ = k;
            break;
        end
    end    
    ii = ii_; jj = 1;    

    X  = 0;
    
    S(1,1) = R(ii,jj,i); 
    
    kk = 1; qq = 1;
    while( X < Z(i,1) )

        B = permn([0 1], N, kk);

        for j = 1:1:size(B,2)

            if( R(ii,jj,i) == 0 )

                kk = kk + 1; 

                break;
            end
            
            if( R(ii,jj,i) && B(1,j) == 0 )

                if( jj < N )

                    jj = jj + 1; 
                end
                        
                S = S + R(ii,jj,i); qq = qq + 1;              
            elseif( R(ii,jj,i) && B(1,j) == 1 )

                if( ii > 1 && jj < N )

                     ii = ii - 1; 
                     jj = jj + 1;
                end               

                S = S + R(ii,jj,i); qq = qq + 1;             
            end     
            
        end

        if( qq == N )

            X  = X + 1;

            kk = kk + 1;

            qq = 1;
            
            SS(1,1) = S(1,1); S = 0;
            
            if( SS( 1 ) < SS( 2 ) )

                SS( 1 ) = 0;
            elseif( SS( 1 ) > SS( 2 ) )

                SS( 2 ) = 0; 
                SS = circshift( SS, 1, 2 );
            end

        end

    end

end
Z = max(S);














