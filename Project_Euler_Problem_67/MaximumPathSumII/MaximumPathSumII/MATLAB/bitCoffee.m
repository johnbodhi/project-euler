function  [ B_ ] = bitCoffee( Q_, J_, B_, SP_ )

    
    if(   B_(J_) && ~SP_(B_(J_),J_) && ~B_(J_+1) && ~SP_(B_(J_),J_+1)   )                                                                                                                                                                                             
    
        B_(J_+1) = B_(J_);
        
        B_(J_)   = 0;
    
    elseif( B_(J_) && SP_(B_(J_),J_) && ~B_(J_+1) && ~SP_(B_(J_),J_+1)  )                                                                                                                                                                                                                      
    
        B_(J_+1  )          = B_(J_);  
        
        SP_( B_(J_), J_+1 ) = SP_( B_(J_), J_+1 ) + 1;
        
        SP_( B_(J_), J_ )   = SP_( B_(J_), J_ ) - 1;                                                                                                                                                                                              
        
        B_(J_)              = 0;                                                                                                                                                                                                                                                                                                                                                                          
                                                                                                                                 
    elseif( B_(J_) && ~SP_(B_(J_),J_) && B_(J_+1) && ~SP_(B_(J_),J_+1)  )
    
        SP_( B_(J_), J_+1 ) = SP_( B_(J_), J_+1 ) + 1;                                                                                                                                                                                      
        
        B_(J_)               = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    
    elseif( B_(J_) && SP_(B_(J_),J_) && B_(J_+1) && ~SP_(B_(J_),J_+1)   )
    
        SP_( B_(J_), J_+1 ) = SP_( B_(J_), J_+1 ) + 1;   
        
        B_(J_)               = SP_(B_(J_),J_);
        
        SP_( B_(J_), J_ )   = SP_( B_(J_), J_ ) - 1;                                                                                                                                                                                                     
    
    elseif( B_(J_) && ~SP_(B_(J_),J_) && B_(J_+1) && SP_(B_(J_+1),J_+1) )
    
        SP_(B_(J_+1),J_+1) = SP_(B_(J_+1),J_+1) + 1;
        
        B_(J_)             = 0;
    
    elseif( B_(J_) && SP_(B_(J_),J_) && B_(J_+1) && SP_(B_(J_),J_+1)  ) 
    
        B_(J_)               = SP(B_(J_),J_);
        
        SP_( B_(J_), J_  )  = SP_( B_(J_), J_ ) - 1;
        
        SP_( B_(J_), J_+1 ) = SP_( B_(J_), J_+1 ) + 1;                                                                                                                                                                                                              
    
    end
end