function [ H_, S_ ] = sol( S_ )

    if( S_(1) <= S_(2) )

        S_(1) = S_(2); S_(2) = 0;

    elseif( S_(1) > S_(2) )

        S_(2) = 0;
    end
    H_ = S_(1);

end