function [F_] = pAdicDT(N_,F_,NEXPSPACE_)

     for k = 1:1:ceil(N_/2)

        ii = 1; jj = 1;

        S_( 1 )   = RA_(ii,jj,k) ;
        S_( 3 )   = RAF_(ii,jj,k);
        % S_( 5 ) = RAC_(ii,jj,k);

        S_( 2 )   = RS_(ii,jj,k) ;
        S_( 4 )   = RSF_(ii,jj,k);
        % S_( 6 ) = RSC_(ii,jj,k);

        for j = 1:1:size(NEXPSPACE_,2)
        
            S_( 1 )   = RA_(ii,jj,k) ;
            S_( 3 )   = RAF_(ii,jj,k);
            % S_( 5 ) = RAC_(ii,jj,k);
    
            S_( 2 )   = RS_(ii,jj,k) ;
            S_( 4 )   = RSF_(ii,jj,k);
            % S_( 6 ) = RSC_(ii,jj,k);
        end
    end
    [F_] = sol(S_,F_);