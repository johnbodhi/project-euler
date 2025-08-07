function [ F_ ] = pAdicDT( N_, F_, B_, NEXPSPACE_ )

     for i = 1:1:size(B_,1)

        % k = sum(B_(i,:),2)+1;

        ii = 2; jj = 1;

        S_( 1 ) = RA_(ii,jj,k);
        S_( 2 ) = RS_(ii,jj,k);

        for j = 1:1:size(B_,2)
            
            if( ~B_(i,j) )
        
                if( jj <= N_-1 )
        
                    jj = jj + 1; 
        
                    S_( 1 ) = S_( 1 ) + RA_(ii,jj,k);
                    S_( 2 ) = S_( 2 ) + RS_(ii,jj,k);
                end           
        
            elseif( B_(i,j) )
        
                if( ii > 1 && jj <= N_-1 )
        
                    ii = ii + 1;
        
                    jj = jj + 1;   
        
                    S_( 1 ) = S_( 1 ) + RA_(ii,jj,k);
                    S_( 2 ) = S_( 2 ) + RS_(ii,jj,k);  
                end

            end           
        end
        [ F_ ] = sol( S_, F_ ); 

     end