function [ Bm_ ] = monteCarlo( EMAX_ )

    OPT = floor( 2^EMAX_ / 2^52 );
    
    Km_ = randi( [0, OPT] )*randi( [0, 2^52 ] );

    Bm_ = permn( [ 0; 1 ], N_-1, Km_ ) );

end