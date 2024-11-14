function [ H_ ] = dT( N_, B_, RA_, RS_, Q_ )

    ii = 2; jj = 1;
    
    S( 1 ) = RA_(ii,jj,Q_);
    S( 2 ) = RS_(ii,jj,Q_);
    
    for j = 1:1:N_-1
    
        if( ~B_(j) )
    
            if( jj <= N_-1 )
    
                jj = jj + 1; 
    
                S( 1 ) = S( 1 ) + RA_(ii,jj,Q_);
                S( 2 ) = S( 2 ) + RS_(ii,jj,Q_);
    
            end           
    
            elseif( B_(j) )
    
            if( ii > 1 && jj <= N_-1 )
    
                ii = ii + 1;
    
                jj = jj + 1;    
    
                S( 1 ) = S( 1 ) + RA_(ii,jj,Q_);
                S( 2 ) = S( 2 ) + RS_(ii,jj,Q_);
    
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

        

