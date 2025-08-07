function [ F_, B_, STL_, STU_, SP_ ] = allocate( Q_, MOD_ )

    DATARANGE  = N-1;

    F_         = zeros( N-1, DATARANGE );

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % We sweep i, and Q to generate bit map.

    B_(1,1:Q_) = permn( (0:1:MOD_)', Q_, 1 );
    
    STL_       = (Q_:-1:2)';

    STU_       = (DATARANGE:-1:Q_)';

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    SP_                    = zeros( MOD_, DATARANGE );

    SP_( B_(1, Q_), Q_-1 ) = B_(1, Q_);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    B_( 1, Q_ ) = 0;