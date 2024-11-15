function [ V_, B_, K_, P_, G_, EXIT_ ] = genFun( N_, Q_, K_, P_ )

    SUP = 1e2; EXIT_ = 0;

    V_  = zeros(N_-1,SUP,ceil(N_/2)); V_(:,1,:) = Inf;
    
    W_ = 0; G_ = 0;

    while( ~W_ )

        B_ = permn([0;1],N_-1,K_);
        
        if( sum(B_,2) == Q_- 1 )
        
            P_ = P_ + 1;

            W_ = 1;

        elseif( sum(B_,2) > Q_- 1 && sum(B_,2) <= ceil(N_/2) && G_ < SUP )

            S = sum(B_,2);

            V = sum(V_(:,:,S),1);

            J = max(find(V));

            V_(:,J+1,S) = B_; G_ = G_ + 1;

            if( G_ == SUP )

                W_ = 1;
            end            

        elseif( sum(B_,2) == N_-1 )

            W_ = 1; EXIT_ = 1;
            
        end
        K_ = K_ + 1;
    end
end