function [ V_, B_, K_, P_, G_, EXIT_ ] = genFun( N_, Q_, K_, P_, EMAX_ )

    SUP = 1e2; EXIT_ = 0;

    S   = zeros(3,1);

    B_  = zeros(3,N_-1);

    V_  = zeros(N_-1,ceil(SUP/2),ceil(N_/2)); V_(:,1,:) = Inf;
    
    W_ = 0; G_ = 0;

    while( ~W_ )

        B_(1,:) = permn([0;1],N_-1,K_);

        B_(2,:) = permn([0;1],N_-1,2^EMAX_-K_);

        B_(3,:) = monteCarlo(EMAX_);

        if( sum(B_(1,:),2) >= Q_- 1 && sum(B_(1,:),2) <= ceil(N_/2) ||...
            sum(B_(2,:),2) >= Q_- 1 && sum(B_(2,:),2) <= ceil(N_/2) ||...
            sum(B_(3,:),2) >= Q_- 1 && sum(B_(3,:),2) <= ceil(N_/2) &&...
            G_ < SUP )

            for i = 1:1:size(B_,1)

                S(i) = sum(B_(i,:),2);
    
                V = sum(V_(:,:,S(i)),1);
    
                J = max(find(V));
    
                V_(:,J+1,S(i)) = B_(i,:); G_ = G_ + 1;
            end

            if( G_ == SUP )

                W_ = 1;
            end    

        elseif( sum(B_(1,:),2) == N_-1 )

            W_ = 1; EXIT_ = 1;            
        end
        K_ = K_ + 1;
        
    end
end