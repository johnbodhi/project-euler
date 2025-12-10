function [F_,B_,A_,STL_,STU_,SP_] = allocate(N_,Q_)

    DATARANGE  = N_-floor(Q_/2)                                              ;

    GENERATORS = 4                                                           ;

    MOD_       = 1                                                           ;
     
    B_         = zeros(GENERATORS,N_-1)                                      ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    B_(3,1:ceil(Q_/2),1:ceil(Q_/2)) = permn( (MOD_:-1:0)', ceil(Q_/2), 1 )   ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    STL_               = (Q_:-1:1)'                                          ;

    STU_               = (DATARANGE:-1:ceil(Q_/2))'                          ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % We need an initial condition in SP_ to avoid bit-skipping in the
    % DNN...

    SP_                               = zeros( MOD_, DATARANGE )             ;

    SP_(B_(3,ceil(Q/2)),ceil(Q_/2)-1) = B_(3,ceil(Q_/2))                     ;

    B_(3,ceil(Q/2))                   = 0                                    ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % We need room for back-propagation in the superposition array 
    % populated during the bit-flip convolution...

    % We can use gradients to mimize our beliefs and expectations about the
    % future bits...

    F_ = zeros( N_-1, DATARANGE )                                            ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % We can batch process the convolution of the directives for the
    % decision tree...

    A_ = zeros(ceil(N_/2),N_)                                                ;                                                      

    for i = 2:2:N_-1

        A_(floor(i/2)+1,1:ceil(i/2)) = 1                                     ;                                                
    end