function  [B_,SP_] = bitCoffee(J_,B_,SP_)

    
    if ( B_(J_-1) && ~SP_(B_(J_-1), J_-1) && ~B_(J_) && ~SP_(B_(J_), J_)     )                                                                                                                                                                      
    
        B_(J_)              = B_(J_-1)                                       ;
        
        B_(J_-1)            = 0                                              ;
    
    elseif ( B_(J_-1) && SP_(B_(J_-1), J_-1) && ~B_(J_) && ~SP_(B_(J_), J_)  )                                                                                                                                                                                                          
    
        B_(J_)                = B_(J_-1)                                       ;
        
        SPNC_(B_(J_), J_-1)   = SPNC_(B_(J_), J_-1) - 1                          ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                                                                                                                                 
    elseif ( B_(J_-1) && ~SP_(B_(J_-1),J_-1) && B_(J_) && ~SP_(B_(J_),J_)    )
    
        SPNC_(B_(J_), J_)     = SPNC_(B_(J_), J_) + 1                            ;                                                                                                                                                                                    
        
        B_(J_-1)              = 0                                              ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
    
    elseif ( B_(J_-1) && SP_(B_(J_-1),J_-1) && B_(J_) && ~SP_(B_(J_),J_)     )
    
        SPNC_( B_(J_), J_ )   = SPNC_( B_(J_), J_ ) + 1                          ;  
        
        SPNC_(B_(J_-1), J_-1) = SPNC_(B_(J_-1), J_-1) - 1                        ;                                                                                                                                                                                                     
    
    elseif ( B_(J_-1) && ~SP_(B_(J_-1),J_-1) && B_(J_) && SP_(B_(J_),J_)     )
    
        SPNC_(B_(J_),J_)      = SPNC_(B_(J_),J_) + 1                             ;
        
        B_(J_-1)              = 0                                              ;
    
    elseif ( B_(J_-1) && SP_(B_(J_-1),J_-1) && B_(J_) && SP_(B_(J_-1),J_)    )
    
        B_(J_-1)              = SPNC_(B_(J_-1), J_-1)                             ;
        
        SPNC_(B_(J_-1), J_-1) = SPNC_(B_(J_-1),J_-1) - 1                         ;
        
        SPNC_(B_(J_-1), J_)   = SPNC_(B_(J_-1),J_) + 1                           ;

    elseif ( ~B_(J_-1) && SP_(B_(J_-1), J_-1) && ~B_(J_) && ~SP_(B_(J_), J_) )                                                                                                                                                                                                

        B_(J_)                = B_(J_-1)                                       ;

        SPNC_(B_(J_), J_-1)   = SPNC_(B_(J_), J_-1) - 1                          ;                 
    
    end