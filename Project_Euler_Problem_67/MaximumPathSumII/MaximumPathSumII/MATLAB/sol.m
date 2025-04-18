function [ F_ ] = sol( X_, F_ )

    MIN = 1; MAX = 1; 
    
    S_ = X_;

    if( MAX )

        if( S_(1) <= S_(2) )
    
            S_(1) = S_(2); S_(2) = 0;
    
        elseif( S_(1) > S_(2) )
    
            S_(2) = 0;
        end
        Y_(1) = S_(1);

        if( Y_(1) >= F_(1) )

            F_(1) = Y_(1);
        end

    end

    S_ = X_;

    if( MIN )
    
        if( S_(1) <= S_(2) )
    
            S_(2) = 0;
    
        elseif( S_(1) > S_(2) )
    
            S_(1) = S_(2); S_(2) = 0;
        end
        Y_(2) = S_(1);

        if( Y_(2) <= F_(2) )

            F_(2) = Y_(2);
        end
    end

end