function  [ C_, SP_ ] = bitCoffee( J_, C_, SP_ )

    % Extend to MOD_ > 1 -> [0,...,N]   

    % Extend objectve function SP_ block as minimizer: 
    % Bit position index (emission), Bit value, Accumulated SP_ values, emission
    % values, Convolution range values, Convolutional range
    % indexes, Logic layer index value, Logic layer column operation output value )
    
    if ( C_(J_-1) && ~SP_(C_(J_-1), J_-1) && ~C_(J_) && ~SP_(C_(J_), J_)   )                                                                                                                                                                      
    
        C_(J_)   = C_(J_-1);
        
        C_(J_-1) = 0;
    
    elseif ( C_(J_-1) && SP_(C_(J_-1), J_-1) && ~C_(J_) && ~SP_(C_(J_), J_) )                                                                                                                                                                                                          
    
        C_(J_)            = C_(J_-1);
        
        SP_(C_(J_), J_-1) = SP_(C_(J_), J_-1) - 1; % FOLI                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                 
    elseif ( C_(J_-1) && ~SP_(C_(J_-1),J_-1) && C_(J_) && ~SP_(C_(J_),J_)   )
    
        SP_(C_(J_), J_) = SP_(C_(J_), J_) + 1;                                                                                                                                                                                    
        
        C_(J_-1)        = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    
    elseif ( C_(J_-1) && SP_(C_(J_-1),J_-1) && C_(J_) && ~SP_(C_(J_),J_)    )
    
        SP_( C_(J_), J_ )   = SP_( C_(J_), J_ ) + 1;  
        
        SP_(C_(J_-1), J_-1) = SP_(C_(J_-1), J_-1) - 1;                                                                                                                                                                                                     
    
    elseif ( C_(J_-1) && ~SP_(C_(J_-1),J_-1) && C_(J_) && SP_(C_(J_),J_)    )
    
        SP_(C_(J_),J_) = SP_(C_(J_),J_) + 1;
        
        C_(J_-1)       = 0;
    
    elseif ( C_(J_-1) && SP_(C_(J_-1),J_-1) && C_(J_) && SP_(C_(J_-1),J_)   )
    
        C_(J_-1)            = SP(C_(J_-1), J_-1);
        
        SP_(C_(J_-1), J_-1) = SP_(C_(J_-1),J_-1) - 1;
        
        SP_(C_(J_-1), J_)   = SP_(C_(J_-1),J_) + 1;

    elseif ( ~C_(J_-1) && SP_(C_(J_-1), J_-1) && ~C_(J_) && ~SP_(C_(J_), J_) ) % ICS                                                                                                                                                                                                  

        C_(J_)            = C_(J_-1);

        SP_(C_(J_), J_-1) = SP_(C_(J_), J_-1) - 1; % FOLI                
    
    end