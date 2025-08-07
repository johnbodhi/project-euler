function  [ B_, SP_ ] = bitCoffee( J_, B_, SP_ )

    % Extend to MOD_ > 1 -> [0,...,N]   

    % Extend objectve function SP_ block as minimizer: 
    % Bit position index (emission), Bit value, Accumulated SP_ values, emission
    % values, Convolution range values, Convolutional range
    % indexes, Logic layer index value, Logic layer column operation output value )
    
    if ( B_(J_-1) && ~SP_(B_(J_-1), J_-1) && ~B_(J_) && ~SP_(B_(J_), J_)   )                                                                                                                                                                      
    
        B_(J_)   = B_(J_-1);
        
        B_(J_-1) = 0;
    
    elseif ( B_(J_-1) && SP_(B_(J_-1), J_-1) && ~B_(J_) && ~SP_(B_(J_), J_) )                                                                                                                                                                                                          
    
        B_(J_)            = B_(J_-1);
        
        SP_(B_(J_), J_-1) = SP_(B_(J_), J_-1) - 1; % FOLI                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                 
    elseif ( B_(J_-1) && ~SP_(B_(J_-1),J_-1) && B_(J_) && ~SP_(B_(J_),J_)   )
    
        SP_(B_(J_), J_) = SP_(B_(J_), J_) + 1;                                                                                                                                                                                    
        
        B_(J_-1)        = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    
    elseif ( B_(J_-1) && SP_(B_(J_-1),J_-1) && B_(J_) && ~SP_(B_(J_),J_)    )
    
        SP_( B_(J_), J_ )   = SP_( B_(J_), J_ ) + 1;  
        
        SP_(B_(J_-1), J_-1) = SP_(B_(J_-1), J_-1) - 1;                                                                                                                                                                                                     
    
    elseif ( B_(J_-1) && ~SP_(B_(J_-1),J_-1) && B_(J_) && SP_(B_(J_),J_)    )
    
        SP_(B_(J_),J_) = SP_(B_(J_),J_) + 1;
        
        B_(J_-1)       = 0;
    
    elseif ( B_(J_-1) && SP_(B_(J_-1),J_-1) && B_(J_) && SP_(B_(J_-1),J_)   )
    
        B_(J_-1)            = SP(B_(J_-1), J_-1);
        
        SP_(B_(J_-1), J_-1) = SP_(B_(J_-1),J_-1) - 1;
        
        SP_(B_(J_-1), J_)   = SP_(B_(J_-1),J_) + 1;

    % elseif ( ~B_(J_-1) && SP_(B_(J_-1), J_-1) && ~B_(J_) && ~SP_(B_(J_), J_) )                                                                                                                                                                                                          
    % 
    %     B_(J_)            = B_(J_-1);
    % 
    %     SP_(B_(J_), J_-1) = SP_(B_(J_), J_-1) - 1; % FOLI                
    
    end