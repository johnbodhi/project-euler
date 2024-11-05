clc; close all; clear all;

N = 100; M = N;

Z = diag( flip( pascal( N ), 2 ) );

qq = 0; pp = 0; kk = 1;

for i = 1:1:ceil(N/2)

    while( pp < Z(i,1) )

        B = permn([0 1],M-1,kk);

        if( sum( B, 2 ) == qq )
    
            pp = pp + 1;

            % V_(:,pp,i) = B;
            
            V_(1:M-1,pp,i) = B;

            V_(M,pp,i)     = kk;
            
        end
        kk = kk + 1;

    end
    qq = qq + 1; pp = 0; kk = 1;

end