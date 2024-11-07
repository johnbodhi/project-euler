function [ H_ ] = dT( B_, RA_, RS_, Q_ )

    global N

    ii = 2; jj = 1;
    
    S( 1 ) = RA_(ii,jj,Q_+1);
    S( 2 ) = RS_(ii,jj,Q_+1);
    
    for j = 1:1:size(B_,2)
    
        if( ~B_(j) )
    
            if( jj <= N-1 )
    
                jj = jj + 1; 
    
                S( 1 ) = S( 1 ) + RA_(ii,jj,Q_+1);
                S( 2 ) = S( 2 ) + RS_(ii,jj,Q_+1);
    
            end           
    
            elseif( B_(j) )
    
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
    H_ = SS_(1);

end

        

