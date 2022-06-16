clc; clear all; close all; tic

L = 28123; A = 0; S = 0;

ii = 1; jj = 1; kk = 1; nn = 1;

for i = 1:L-1
    N( i ) = i; 
end

for j = L:-1:2
    
    for i = 1:1:j-1

        if( mod( j, i ) == 0 )
            PD( ii ) = i; 
            ii = ii + 1;
        end
    end

    if( sum( PD ) > j )

        A( jj ) = j; jj = jj + 1;
    end

    clear PD; ii = 1;
end

for j = 1:size(A,2)
    for i = j:size(A,2)
        
        if( sum( [ A( j ) A( i ) ] ) < L )
            G( nn ) = sum( [ A( j ) A( i ) ] ); nn = nn + 1;
        end
    end
end

for i = 1:size(A,2)

    [ ~, P, ~ ] = find( G == A( i ) );
    if( isempty( P ) )
        
    else
        R( i ) = G( P( 1 ) );
    end
end

for i = 1:size( N, 2 )

     [ ~, P, ~ ] = find( R == N( i ) );

     if( isempty( P ) )
       
     else

         N( i ) = 0;
     end    
end

for i = 1:size( N, 2 )

     [ ~, P, ~ ] = find( G == N( i ) );

     if( isempty( P ) )
       
     else

         N( i ) = 0;
     end    
end
S = sum( N ); toc