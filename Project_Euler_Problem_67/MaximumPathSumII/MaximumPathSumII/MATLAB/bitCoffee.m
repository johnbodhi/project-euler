function  [ C_, SP_ ] = bitCoffee( J_, C_, SP_ )

    
    if ( C_(J_-1) && ~SP_(C_(J_-1), J_-1) && ~C_(J_) && ~SP_(C_(J_), J_)   )                                                                                                                                                                      
    
        C_(J_)   = C_(J_-1);
        
        C_(J_-1) = 0;
    
    elseif ( C_(J_-1) && SP_(C_(J_-1), J_-1) && ~C_(J_) && ~SP_(C_(J_), J_) )                                                                                                                                                                                                          
    
        C_(J_)            = C_(J_-1);
        
        SP_(C_(J_), J_-1) = SP_(C_(J_), J_-1) - 1;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                                                                 
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

    elseif ( ~C_(J_-1) && SP_(C_(J_-1), J_-1) && ~C_(J_) && ~SP_(C_(J_), J_) )                                                                                                                                                                                                

        C_(J_)            = C_(J_-1);

        SP_(C_(J_), J_-1) = SP_(C_(J_), J_-1) - 1;                 
    
    end