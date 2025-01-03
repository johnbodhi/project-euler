function [ B_ ] = monteCarlo(N_,EMAX_)

    if( 2^EMAX_ <= 2^52 )

        K_ = randi( [0, floor(2^EMAX_)] );

    else

        OPT = floor(2^EMAX_/2^52);
        
        K_ = randi( [0, OPT] ) * randi( [0, 2^52] );

    end

    B_ = permn([0;1],N_-1,K_);

end