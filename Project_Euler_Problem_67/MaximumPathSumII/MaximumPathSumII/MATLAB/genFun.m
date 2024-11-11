function [ B_, V_, K_ ] = genFun( Q_, K_ )

    global N

    Z = diag(flip(pascal(N),2));

    SUP = 1e2;
    
    V_ = zeros(N,SUP,N); V_(:,1,:) = Inf;

    if( Q_ == 1 )
    
            K_ = 1;

            B_ = permn([0;1],N-1,K_);

    elseif( Q_ == 2 )

        for i = 1:1:Z(2)
        
            K_(i,1) = 0.5*(2^i+2);
        end
        B_ = permn([0;1],N-1,K_);

    elseif( Q_ > 2 )

        P = 0;

        while( ~P )
    
            B_ = permn([0;1],N-1,K_);
            
            if( sum(B,2) == Z(Q_) )
            
                P  = P + 1;

                V_ = 0;
    
            elseif( sum(B,2) > Q_ )
    
                S = sum(B_,2);
    
                V = sum(V_(:,:,S),1);
    
                J = max(find(V)); J = J + 1;
    
                V_(:,J,S) = B_; 
                
                K_ = K_ + 1;

            end            
        end
    end

end