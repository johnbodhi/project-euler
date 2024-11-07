function [ H_ ] = dTa( V_, RA_, RS_, Q_ )

    global N

    S_ = zeros(N,N,ceil(N/2),2);

    S_(:,:,1) = squeeze(sum(V_(:,:,1:ceil(N/2)),1)  );
    S_(:,:,2) = squeeze(sum(V_(:,:,ceil(N/2))+1:N,1));


    for k = 1:1:size(S_,3)
        for j = 2:1:size(S_,2)
    
            F(j,k) = max(find(S_(:,j,k)))+1;
        end
    end


    for k = 1:1:size(F,2)
        for j = 1:1:size(F,1)
            for i = 1:1:F(j,k)

                ii = 2; jj = 1;
        
                S( 1 ) = RA_(ii,jj,Q_+1);
                S( 2 ) = RS_(ii,jj,Q_+1);
    
                for i = 1:1:size(V_,1)
        
                    if( ~S_(i,j,1) || ~S_(i,j,2) )
                
                        if( jj <= N-1 )
                
                            jj = jj + 1; 
                
                            S( 1 ) = S( 1 ) + RA_(ii,jj,Q_+1);
                            S( 2 ) = S( 2 ) + RS_(ii,jj,Q_+1);
                
                        end           
                
                    elseif( S_(i,j,1) || S_(i,j,2) )
                
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
    end
    H_ = SS_;

end