function [ H_ ] = dTm( N_, V_, RA_, RS_ )

    S_(:,:) = squeeze(sum(V_(:,:,:),1)); H_ = 0;
   
    for k = 1:1:ceil(N_/2)

        F_(k) = max(find(S_(:,k)));                
    end

    for k = 1:1:ceil(N_/2)-1

        for j = 2:1:F_(k)

            if( F_(k) <= 1 )
            
                break;
            end

            ii = 2; jj = 1;

            S( 1 ) = RA_(ii,jj,k+1);
            S( 2 ) = RS_(ii,jj,k+1);

            for i = 1:1:N_-1

                if( ~V_(i,j,k) )
            
                    if( jj <= N_-1 )
            
                        jj = jj + 1; 
            
                        S( 1 ) = S( 1 ) + RA_(ii,jj,k+1);
                        S( 2 ) = S( 2 ) + RS_(ii,jj,k+1);
            
                    end           
            
                elseif( V_(i,j,k) )
            
                    if( ii > 1 && jj <= N_-1 )
            
                        ii = ii + 1;
            
                        jj = jj + 1;    
            
                        S( 1 ) = S( 1 ) + RA_(ii,jj,k+1);
                        S( 2 ) = S( 2 ) + RS_(ii,jj,k+1);
            
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
            H_ = SS_( 1 );

        end
    end
end