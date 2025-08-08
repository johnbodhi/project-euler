function [F_] = pAdicDT(N_,F_,B_,NEXPSPACE_)

     for k = 1:1:N_

        ii = 1; jj = 1;

        S_( 1 ) = RA_(ii,jj,k) ;
        S_( 2 ) = RS_(ii,jj,k) ;

        S_( 3 ) = RAF_(ii,jj,k);
        S_( 4 ) = RSF_(ii,jj,k);

        S_( 5 ) = RAC_(ii,jj,k);
        S_( 6 ) = RSC_(ii,jj,k);

        for j = 1:1:size(B_,2)
            
            if( ~B_(i,j) )
        
                if( jj <= N_-1 )
        
                    jj = jj + 1; 
        
                    S_( 1 ) = S_( 1 ) + RA_(ii,jj,k) ;
                    S_( 2 ) = S_( 2 ) + RS_(ii,jj,k) ;

                    S_( 3 ) = S_( 3 ) + RAF_(ii,jj,k);
                    S_( 4 ) = S_( 4 ) + RSF_(ii,jj,k);

                    S_( 5 ) = S_( 5 ) + RAC_(ii,jj,k);
                    S_( 6 ) = S_( 6 ) + RSC_(ii,jj,k);
                end

            end
        end
    end
    [F_] = sol(S_,F_); 
