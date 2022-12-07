clear all; close all; clc; tic

% We can read in a triangle froma file, or generate a triangle of arbitrary
% size to find a path from the top to bottom which yields a maximum sum for
% any lowwr trianglular matrix containing random numbers...

A = [ 3 0 0 0; 7 4 0 0; 2 4 6 0; 8 5 9 3 ]; 
%  A = readmatrix("triangle_small.csv"); 
% A = csvread("triangle_large.csv"); 

% N = 200; M = N;
% 
% for j = 1:M
%     for i = 1:N
%         if( i < j || i == j)
%             A( i, j ) = randi( [ 10,99 ] );
%             B( i, j ) = i;
%         end
%     end
% end

% Transpose matrix A to march through natrually.

A = A';

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

% Re-assign all true values in matrix A associated with the Trellis indexes to
% matrix R.

D = flip(D,2);

for k = 1:size(D,3)
    for j = 1:size(D,2)
        for i = 1:size(D,1)
            if( D( i, j, k ) )
                R( i, j, k ) = A( D( i, j, k ), j );
            end            
        end
    end
end

D = flip(D,2); R = flip(R,2);

% Find all legal paths through the Trellis.

Z = diag( flip( pascal( size( A, 1 ) ), 2 ) ); % Number of paths through the triangle from each bottom index.

B = zeros(1,2);  

RR = zeros(1,2); RR( 1 ) = 1; % Off-set RR to avoid pre-mature break.

for s = 1:1:size( Z, 1 )          

    if( s == 1 )
            
        B( 1 ) = sum( R( s, :, s ) );
        
        if( B( 1 ) < B( 2 ) )
            B( 1 ) = 0;
        elseif( B( 1 ) > B( 2 ) )
            B( 2 ) = 0;
            B = circshift( B, 1, 2 );
        end

    elseif( s == size(Z,1) )

        B( 1 ) = sum( diag( flip( R( :, :, size( D, 3 ) ), 2 ) ), 1 ); 

        if( B( 1 ) < B( 2 ) )
            B( 1 ) = 0;
        elseif( B( 1 ) > B( 2 ) )
            B( 2 ) = 0;
            B = circshift( B, 1, 2 );
        end

    else

        N = size(A,1); E = zeros(1,N);

        % Generate "elbow" vector.

        E( 1, 1 ) = 1; E( 1, ( N - ( N - s + 1 ) )+1:end ) = s;        
        
        for j = 2:( N - ( N - s + 1 ) )
            E( 1, j ) = j;
        end

        % Maximum terminal vector.

        ll = 0;
        for j = 1:size( E, 2 )
            if( j <= N - s + 1 )
                T( 1, j ) = 1;
            elseif( j > N - s + 1 )
                T( 1, j ) = ( N - ( N - s + 1 ) ) + ll;
                ll = ll + 1;
            end
        end

        V = zeros( 1, N ); 
        
        V( 1, ( N - ( N - s + 1 ) )+1 ) = 1;     
        
        rr = 0; yy = 0; gg = 0; 
        
        ee = 0; ww = 0; oo = 0;
        
        uu = 1; aa = 1;
        
        while( rr < Z( s ) )
        %while( RR( 2 ) ~= RR( 1 ) )
            
            % We can use "operation distance" from default vector to group
            % permutations.        

            if( rr == 0 )
                C = E;
            elseif( rr ~= 0 && V( 1, end ) == 0 )
                C = C - V;             
            end

            xx = 0;
            for ff = 1:size( Z, 1 )
                if( C( 1, ff ) == T( 1, ff ) )
                    xx = xx + 1;
                end
            end         
            
            ss = 1;
            for ff = 2:size( Z, 1 )
                if( C( 1, ff ) - C( 1, ff - 1 ) == 1 || C( 1, ff ) == C( 1, ff - 1 ) )
                    ss = ss + 1;
                    if( ss == N - 1 && xx < N && size( V, 2 ) <= N && V( 1, end ) == 0 )
                        rr = rr + 1;                              
                    end
                end
            end
            ss = 1;
            
            C = flip( C, 2 );
            for kk = s
                for jj = 1:size(R,2)
                    for ii = 1:size(R,1)
                        if( D( ii, jj, kk ) == C( 1, jj ) ) 
                            H( 1, jj ) = R( C( 1, jj ) , jj, kk );
                        end                        
                    end                    
                end
            end       
            C = flip( C, 2 );
            
            B( 1 ) = sum( H( 1, : ) );
            
            if( B( 1 ) < B( 2 ) )
                B( 1 ) = 0;
            elseif( B( 1 ) > B( 2 ) )
                B( 2 ) = 0; 
                B = circshift( B, 1, 2 );
            end
                
            % We need to group our permutation vectors according 
            % to the subtrahend vector.
            
            pp = find( V, 1, 'first' );
            
            qq = size( find( C( 1, : ) == s ), 2 );
            
            % tt = size( find( C( 1, : ) == s - 1 - yy ), 2 );
            
            ee = size( find( C( 1, : ) == 1 ), 2 );
                
            if( rr >= 2 && uu < N - s && yy <  s - 1 )
            
                uu = uu + 1;                   

                V = zeros( 1, N );
                
                if( gg < s - 1 )

                    if( ( N - ( N - s + 1 ) )+uu-yy ~= ee + 1 )
                        while( ( N - ( N - s + 1 ) )+uu-yy < ee + 1 )
                            uu = uu + 1;
                        end
                    end  
                 
                    V( 1, ( N - ( N - s + 1 ) )+uu-yy:( N - ( N - s + 1 ) )+uu-yy+gg ) = 1;
                    oo = find( V, 1, 'last' );
                elseif( gg >= s - 1 )                 
                    
                    if( aa < s - 1 )

                        aa = aa + 1;

                        if( ww == ( N - ( N - s + 1 ) )+uu-yy )
                            uu = uu + 1;                             
                        elseif( ( N - ( N - s + 1 ) )+uu-yy ~= pp + 1 )
                            while( ( N - ( N - s + 1 ) )+uu-yy < pp + 1 )
                                uu = uu + 1;
                            end
                        end  

                        V( 1, ( N - ( N - s + 1 ) )+uu-yy:( N - ( N - s + 1 ) )+uu-yy+gg ) = 1;
                        oo = find( V, 1, 'last' );
                    elseif( aa == s - 1 && ee ~= N - s + 1 )
                        
                        aa = 1; bb = gg - 2;
                        V( 1, ( N - ( N - s + 1 ) )+aa+uu-yy+bb:( N - ( N - s + 1 ) )+aa+uu-yy+gg+bb ) = 1; 
                        oo = find( V, 1, 'last' );

                        ww = ( N - ( N - s + 1 ) )+aa+uu-yy+bb; 
                        pp = find( V, 1, 'first' );
                        uu = uu + 1;
                    end                                  

                end
                
            elseif( rr >= 2 && uu == N - s && yy < s - 1 )

                uu = 1;
                
                yy = yy + 1;
    
                V = zeros( 1, N ); 

               if( gg < s - 1 )
                
                    V( 1, ( N - ( N - s + 1 ) )+uu-yy:( N - ( N - s + 1 ) )+uu-yy+gg ) = 1;       
                    oo = find( V, 1, 'last' );
                elseif( gg >= s - 1 )                    
                    
                    if( aa < s - 1 )

                        aa = aa + 1;
                        V( 1, ( N - ( N - s + 1 ) )+uu-yy:( N - ( N - s + 1 ) )+uu-yy+gg ) = 1;    
                        oo = find( V, 1, 'last' );
                    elseif( aa == s - 1 )

                        aa = 1; bb = gg - 2;
                        V( 1, ( N - ( N - s + 1 ) )+aa+uu-yy+bb:( N - ( N - s + 1 ) )+aa+uu-yy+gg+bb ) = 1;
                        oo = find( V, 1, 'last' );
                        uu = uu + 1;
                    end

               end
            end           
            
            tt = size( find( C( 1, : ) == 2 ), 2 );    

            if( rr >= 2 && qq == 1 && ee == N - s + 1 && yy >= s - 1 )
                
                C = E; yy = 1; uu = 1; gg = gg + 1; 
                
                V = zeros( 1, N ); 
            
                V( 1, ( N - ( N - s + 1 ) ):( N - ( N - s + 1 ) )+gg ) = 1;

                N;
            
            elseif( rr >= 2 && qq == 1 && ee == N - s && tt == gg + 1 )
                
                C = E; yy = 1; uu = 1; gg = gg + 1; 
                
                V = zeros( 1, N ); 
            
                V( 1, ( N - ( N - s + 1 ) ):( N - ( N - s + 1 ) )+gg ) = 1;

                N;
                
            elseif( ( rr >= 2 && yy < s - 1 && size( V, 2 ) > size( C, 2 ) && gg < size( V, 2 ) - 3 ) || ( oo >= size( V, 2 ) && gg < size( V, 2 ) - 3 ) )
                
                C = E; yy = 1; uu = 1; gg = gg + 1; 
                
                V = zeros( 1, N ); 
            
                V( 1, ( N - ( N - s + 1 ) ):( N - ( N - s + 1 ) )+gg ) = 1;                

                N;
            end         

            % Store convergence accuumulator to break process when no
            % increment occurs.

            RR( 1 ) = rr;
            RR = circshift( RR, 1, 2 );

            if( RR( 1 ) == RR( 2 ) )
                break;
            end

        end
    end
end
toc;