function [ B_ ] = genFun( U_ )

    global N

    if( U_ == 1 )
    
            K_(1,1) = 1;

            B_ = permn([0;1],N-1,K_);

    elseif( U_ == 2 )

        for i = 1:1:N
        
            K_(i,1) = 0.5*(2^i+2);
        end
        B_ = permn([0;1],N-1,K_);

    elseif( U_ > 2 )
            
            
            
            B_ = permn([0;1],N-1,K_);

    end

end