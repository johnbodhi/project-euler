function [ H_ ] = dTa( V_, RA_, RS_, Q_ )

    global N

    S_ = squeeze(sum(V_(:,:,:),1));


    for i = 1:1:size(S_,2)

        X = find(V(:,j));

        if ( ~isinf(X) )

            F(i) = max(find(S_(:,j)));
        else
            
            F(i) = 0;
        end
    end
    

    for k = 1:1:size(V_,3)

        for j = 1:1:F(k)

            ii = 2; jj = 1;
    
            S( 1 ) = RA_(ii,jj,Q_+1);
            S( 2 ) = RS_(ii,jj,Q_+1);

            for i = 1:1:size(V_,1)
    
                if( ~V_(i,j,k) || )
            
                    if( jj <= N-1 )
            
                        jj = jj + 1; 
            
                        S( 1 ) = S( 1 ) + RA_(ii,jj,Q_+1);
                        S( 2 ) = S( 2 ) + RS_(ii,jj,Q_+1);
            
                    end           
            
                    elseif( V_(i,j,k) || )
            
                    if( ii > 1 && jj <= N-1 )
            
                        ii = ii + 1;
            
                        jj = jj + 1;    
            
                        S( 1 ) = S( 1 ) + RA_(ii,jj,Q_+1);
                        S( 2 ) = S( 2 ) + RS_(ii,jj,Q_+1);
            
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
    H_ = SS_;
end