function [F_] = sol(X_,F_)

    MIN = 1; MAX = 1; 
    
    S_ = X_;

    if( MAX )

        for j = 2:1:size(S_,2)

            if( S_(j-1) <= S_(j) )
        
                S_(j-1) = S_(j); S_(j) = 0;
        
            elseif( S_(j-1) > S_(j) )
        
                S_(j) = 0;
            end
            Y_(1) = S_(j-1);
    
            if( Y_(1) >= F_(1) )
    
                F_(1) = Y_(1);
            end
            S_ = X_;

        end

    end

    S_ = X_;

    if( MIN )

        for j = 2:1:size(S_,2)
    
            if( S_(j-1) <= S_(j) )
        
                S_(j) = 0;
        
            elseif( S_(j-1) > S_(j) )
        
                S_(j-1) = S_(j); S_(j) = 0;
            end
            Y_(2) = S_(j-1);
    
            if( Y_(2) <= F_(2) )
    
                F_(2) = Y_(2);
            end
            S_ = X_;

        end

    end
