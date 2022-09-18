clear all; close all; clc; tic;

K = 1e3; F = 1;

ii = 1; kk = 1;

for i = 1:1:ceil( F * sqrt( K ) ) 

    C( i ) = i * i;
end

jj = 0;
for i = 1:1:K

    M = floor( log10( i ) + 1 );

    R =  i;

    for j = 1:1:M

        D( j )  = R - floor( R / 10 ) * 10;
    
        E( M - j + 1 ) = D( j );
    
        R = floor( R / 10 );
    end

    for k = 1:1:M

        if( D( k ) == E( k ) )
    
            jj = jj + 1;    
        end
    end

    if( jj == M )

        B( ii ) = i; ii = ii + 1;
    end
    jj = 0;
end

S = 0; SS = 0; ll = 0; A = zeros(1,2);

for k = 1:1:size( B,2 )
    for j = 1:1:ceil( sqrt( B( 1,k ) ) )
        for i = 1:1:j-1

            if( C( 1,i ) < B( k ) )

                S = sum( C( 1, i:j ), 2 );
            else

                break;
            end

            A(1) = S;

            if( S == B( k ) && ll == 0 && A(2) ~= A(1) )

                SS = SS + S; 
                
                A(2) = S;

                ll = ll + 1;
            end

            S = 0;
        end
    end
    ll = 0;
end
toc;