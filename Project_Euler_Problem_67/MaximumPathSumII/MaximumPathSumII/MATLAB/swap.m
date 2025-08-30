function [ Y_ ] = swap( X_, S_ )
        

        if ( S_ == 1 )

            ii = 0;
            for k = 2:1:size(X_,3)
                for j = 1:1:size(X_,2)
                    for i = 1:1:floor(k/2)
        
                        L            = X_(k-ii,j,k);
                        X_(k-ii,j,k) = X_(i,j,k);
                        X_(i,j,k)    = L;
                        ii           = ii + 1;                
                    end
                    ii = 0;
                end
            end
            Y_ = X_;

        elseif ( S_ == 2 )
    
            jj = 0;
            for k = 1:1:size(X_,3)
                for i = 1:1:k
                    M_ = k-1;
                    for j = 1:1:ceil(M_/2)
        
                        L             = X_(i,M_-jj,k);
                        X_(i,M_-jj,k) = X_(i,j,k);
                        X_(i,j,k)     = L;
                        jj            = jj + 1;                
                    end
                    jj = 0;
                end
            end
            Y_ = X_;

        end