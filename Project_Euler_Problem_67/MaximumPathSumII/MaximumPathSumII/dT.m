function [ SS_ ] = dT( B_ )

    for i = 1:1:size(B_,1)

        if( sum(B_(i,:),2) == Q )

            P = P + 1;

            ii = 2; jj = 1;

            S( 1 ) = RA(ii,jj,Q+1);
            S( 2 ) = RS(ii,jj,Q+1);

            for j = 1:1:size(B_,2)

                if( ~B_(i,j) )

                    if( jj <= N-1 )

                        jj = jj + 1; 

                        S( 1 ) = S( 1 ) + RA(ii,jj,Q+1);
                        S( 2 ) = S( 2 ) + RS(ii,jj,Q+1);

                    end           

                    elseif( B_(i,j) )

                    if( ii > 1 && jj <= N-1 )

                        ii = ii + 1;

                        jj = jj + 1;    

                        S( 1 ) = S( 1 ) + RA(ii,jj,Q+1);
                        S( 2 ) = S( 2 ) + RS(ii,jj,Q+1);

                    end    
                end 
            end
        end

        if( S( 1 ) >= S( 2 ) )

            S( 2 ) = 0;
        elseif( S( 1 ) < S( 2 ) )

            S( 1 ) = S( 2 );
        end

        SS_( 2 ) = S( 1 );

        if( SS_( 1 ) >= SS_( 2 ) )

            SS_( 2 ) = 0;
        elseif( SS_( 1 ) < SS_( 2 ) )

            SS_( 1 ) = SS_( 2 );
        end

    end

end
