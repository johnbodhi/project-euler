clear all; close all; clc; tic

% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv");
A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
% A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv"); 

N = size(A,1); M = size(A,2);

AS = zeros(size(A,1),size(A,2));
for i = 1:1:size(A,1)

    AS(i,1:i) = flip(A(i,1:i),2);
end

A  = A';
AS = AS';

D = zeros( size(A,1), size(A,2), size(A,1) );

for k = size( D, 3 ):-1:1
    for j = 1:1:size( D, 2 )
        for i = 1:1:size( D, 1 )               

            if( k == size(D,3) )
                cc = 0;
                for jj = 1:size(D,2)
                    for ii = 1:size(D,1)
                        if( ii == jj )
                            D( k - cc, jj, k ) = k - cc;
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

D  = flip(D,2);

RA = zeros(N,M); 
RS = zeros(N,M);

for k = 1:ceil(size(D,3)/2)
    for j = 1:size(D,2)
        for i = 1:size(D,1)
            if( D( i, j, k ) )

                RA( i, j, k ) = A( D( i, j, k ), j );

                RS( i, j, k ) = AS( D( i, j, k ), j );
            end            
        end
    end
end

D = flip(D,2);

RA = circshift(RA,1,1);
RS = circshift(RS,1,1);

Z = diag( flip( pascal( size( A, 1 ) ), 2 ) );

S  = zeros(1,2);
SS = zeros(1,2);

G = 2.^(2-N:0); V = [0;1];

qq = 0; pp = 0; rr = 1;

for u = 1:1:ceil(N/2)

    while( pp < Z(u) )
        
        I = ((rr-.5) * G);
        I = rem(floor(I), 2) + 1;
        B = V(I)';
        
        % B = permn([0;1],N-1,rr);
        
        if( sum(B,2) == qq )

            pp = pp + 1;

            ii = 2; jj = 1;

            S( 1 ) = RA(ii,jj,qq+1);
            S( 2 ) = RS(ii,jj,qq+1);

            for j = 1:1:Z(qq+1)

                for i = 1:1:size(B,2)

                    if( ~B(i) )

                        if( jj <= N-1 )

                            jj = jj + 1; 

                            S( 1 ) = S( 1 ) + RA(ii,jj,qq+1);
                            S( 2 ) = S( 2 ) + RS(ii,jj,qq+1);

                        end           

                    elseif( B(i) )

                        if( ii > 1 && jj <= N-1 )

                            ii = ii + 1;

                            jj = jj + 1;    

                            S( 1 ) = S( 1 ) + RA(ii,jj,qq+1);
                            S( 2 ) = S( 2 ) + RS(ii,jj,qq+1);

                        end

                    end        
                end
                
                if( S( 1 ) >= S( 2 ) )

                    S( 2 ) = 0;
                elseif( S( 1 ) < S( 2 ) )

                    S( 1 ) = S( 2 );
                end
                
                SS( 2 ) = S( 1 );
                
                if( SS( 1 ) >= SS( 2 ) )

                    SS( 2 ) = 0;
                elseif( SS( 1 ) < SS( 2 ) )

                    SS( 1 ) = SS( 2 );
                end
                
                S( 1 ) = RA(ii,jj,qq+1);
                S( 2 ) = RS(ii,jj,qq+1);

            end 
        end
        rr = rr + 1;
    end
    qq = qq + 1; pp = 0; rr = 1;
end
H = max(SS); toc;