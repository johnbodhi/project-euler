clc; close all; clear all; tic

L = 10000000; 

A = numbers( L );

ii = 0; G = 0;

for i = L-1:-1:1

    E = A ( i );

    while( ii < 1 )        

        S = sumSquareComp( E );

        if( S == 89 )
            ii = ii + 1;
            G = G + 1;
        end

        E = S;     

        if( E == 1 )
            break
        end
    end
    ii = 0;
end

toc

function [ F ] = sumSquareComp( X )

    M = double( floor( log10( X ) + 1 ) ); R = X; 
    
    for j = 1:M
        D( j ) = R - floor( R / 10 ) * 10;
        R = floor( R / 10 );
        O( j ) = D( j )^2;
    end
    F = sum( O );

end





