clear all; close all; clc; tic

global N

[ RA, RS, D ] = trellis();

Z = diag(flip(pascal(N),2));

S  = zeros(1,2);
SS = zeros(1,2);

G = 2.^(2-N:0); V = [0;1];

qq = 0; pp = 0; rr = 1;

for u = 1:1:ceil(N/2)

    while( pp < Z(u) )
        
        I = ((rr-.5)*G);

        I = rem(floor(I),2)+1;

        B = V(I)';
        
        % B = permn([0;1],N-1,rr);
        
        if( sum(B,2) == qq )

            pp = pp + 1;

            ii = 2; jj = 1;

            S( 1 ) = RA(ii,jj,qq+1);
            S( 2 ) = RS(ii,jj,qq+1);

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

        end
        rr = rr + 1;

    end
    qq = qq + 1; pp = 0; rr = 1;
    
end
H = max(SS); toc;