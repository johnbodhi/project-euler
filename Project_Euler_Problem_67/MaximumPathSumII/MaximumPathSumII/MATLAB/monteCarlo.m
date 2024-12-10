function [ B_ ] = monteCarlo( N_, EMAX_ )

    OPT = floor( 2^EMAX_ / 2^52 );
    
    K_ = randi( [floor(OPT/1.001), OPT] ) * randi( [floor(OPT/1.001), 2^52 ] );

    B_ = permn( [0;1], N_-1, K_ );

end