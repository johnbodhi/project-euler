function [ Y_ ] = swap( X_ )

    ii = 0;
    for k = 2:1:size(X_,3)
        for j = 1:1:size(X_,2)
            for i = 1:1:floor(k/2)

                L              = X_(k+1-ii,j,k);
                X_(k+1-ii,j,k) = X_(i+1,j,k);
                X_(i+1,j,k)    = L;
                ii = ii + 1;                
            end
            ii = 0;
        end
    end
    Y_ = X_;
