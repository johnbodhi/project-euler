function [ Y_ ] = swap( X_, S_ )
        

        if ( S_ == 1 )

            for l = 1:1:size(X_,4)
                for k = size(X_,3):-1:1
                    for i = 1:1:size(X_,1)
                    
                        [I,~,~]              = find(X_(:,i,k,l))         ;
                        N_                   = size(find(I),1)           ;
                        X_(I(1):I(N_),i,k,l) = flip(X_(I(1):I(N_),i,k,l));
                    end
                end
            end
            Y_ = X_;

        elseif ( S_ == 2 )

            for l = 1:1:size(X_,4)            
                for k = size(X_,3):-1:1
                    for j = 1:1:size(X_,2)
                    
                        [~,J,~]              = find(X_(j,:,k,l))         ;
                        M_                   = size(find(J),2)           ;
                        X_(j,J(1):J(M_),k,l) = flip(X_(j,J(1):J(M_),k,l));
                    end
                end
            end
            Y_ = X_;

        end