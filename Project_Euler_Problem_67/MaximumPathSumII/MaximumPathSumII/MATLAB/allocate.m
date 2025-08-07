function [ F_, B_, STL_, STU_, SP_ ] = allocate( Q_, MOD_ )

    DATARANGE  = N-1;

    F_         = zeros( N-1, DATARANGE );

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    B_    = permn( (MOD_:-1:0)', ceil(Q_/2), 1 );
    
    STL_  = (ceil(Q_/2):-1:2)';

    STU_  = (DATARANGE:-1:ceil(Q_/2))';

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    SP_                    = zeros( MOD_, DATARANGE );

    SP_( B_(1, Q_), Q_-1 ) = B_(1, Q_);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    B_( 1, Q_ ) = 0;