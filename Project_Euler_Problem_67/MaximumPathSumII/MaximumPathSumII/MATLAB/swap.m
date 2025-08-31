function [ Y_ ] = swap( X_, S_ )
        

        if ( S_ == 1 )

            for k = size(X_,3):-1:1
                for i = 1:1:size(X_,2)

                    [I,~,~]            = find(X_(:,i,k));
                    N_                 = size(find(I),1);
                    X_(I(1):I(N_),i,k) = flip(X_(I(1):I(N_),i,k));
                end
            end
            Y_ = X_;

        elseif ( S_ == 2 )
            
            for k = size(X_,3):-1:1
                for i = 1:1:k
                    
                    [~,J,~]            = find(X_(i,:,k));
                    M_                 = size(find(J),2);
                    X_(i,J(1):J(M_),k) = flip(X_(i,J(1):J(M_),k));
                end
            end
            Y_ = X_;

        end