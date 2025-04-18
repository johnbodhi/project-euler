function [ Y_ ] = sol( X_ )

    MIN = 1; MAX = 1; S_ = X_;

    if( MAX )

        if( S_(1) <= S_(2) )
    
            S_(1) = S_(2); S_(2) = 0;
    
        elseif( S_(1) > S_(2) )
    
            S_(2) = 0;
        end
        H_(1) = S_(1);        

        if( Y_(1) <= H_(1) )
    
            H_(1) = 0;
    
        elseif( Y_(1) > H_(2) )
    
            Y_(1) = H_(1); H_(1) = 0;
        end

    end

    S_ = X_;

    if( MIN )
    
        if( S_(1) <= S_(2) )
    
            S_(2) = 0;
    
        elseif( S_(1) > S_(2) )
    
            S_(1) = S_(2); S_(2) = 0;
        end
        H_(2) = S_(1);

        if( Y_(2) <= H_(2) )
    
            H_(2) = 0;
    
        elseif( Y_(2) > H_(2) )
    
            Y_(2) = H_(2); H_(2) = 0;
        end

    end    

end