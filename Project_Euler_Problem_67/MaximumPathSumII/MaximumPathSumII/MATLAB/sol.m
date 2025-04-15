function [ H_, S_ ] = sol( S_ )

    MIN = 1; MAX = 1;

    if( MAX )

        if( S_(1) <= S_(2) )
    
            S_(1) = S_(2); S_(2) = 0;
    
        elseif( S_(1) > S_(2) )
    
            S_(2) = 0;
        end
        H_(1) = S_(1);

    end

    if( MIN )
    
        if( S_(1) <= S_(2) )
    
            S_(2) = 0;
    
        elseif( S_(1) > S_(2) )
    
            S_(1) = S_(2); S_(2) = 0;
        end
        H_(2) = S_(1);

    end

end