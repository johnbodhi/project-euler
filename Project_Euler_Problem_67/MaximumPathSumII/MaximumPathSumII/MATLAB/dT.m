function [ H_ ] = dT( N_, B_, RA_, RS_ )

    for i = 1:1:size(B_,1)

        k = sum(B_(i,:),2)+1;

        ii = 2; jj = 1;

        S( 1 ) = RA_(ii,jj,k);
        S( 2 ) = RS_(ii,jj,k);

        for j = 1:1:size(B_,2)

            if( ~B_(i,j) )
        
                if( jj <= N_-1 )
        
                    jj = jj + 1; 
        
                    S( 1 ) = S( 1 ) + RA_(ii,jj,k);
                    S( 2 ) = S( 2 ) + RS_(ii,jj,k);            
                end           
        
            elseif( B_(i,j) )
        
                if( ii > 1 && jj <= N_-1 )
        
                    ii = ii + 1;
        
                    jj = jj + 1;    
        
                    S( 1 ) = S( 1 ) + RA_(ii,jj,k);
                    S( 2 ) = S( 2 ) + RS_(ii,jj,k);            
                end    
            end                
        end

        if( S(1) >= S(2) )

            S(2) = 0;
        elseif( S(1) < S(2) )
        
            S(1) = S(2);                
        end
        H_ = S(1);

    end

end