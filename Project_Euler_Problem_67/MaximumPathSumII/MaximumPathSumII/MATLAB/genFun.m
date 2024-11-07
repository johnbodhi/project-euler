function [ B_, V_ ] = genFun( Q_, U_, K_ )

    global N
    
    V_ = zeros(N,N,ceil(N/2)); V_(:,1,:) = Inf;

    if( U_ == 1 )
    
            K_(1,1) = 1;

            B_ = permn([0;1],N-1,K_);

    elseif( U_ == 2 )

        for i = 1:1:N
        
            K_(i,1) = 0.5*(2^i+2);
        end
        B_ = permn([0;1],N-1,K_);

    elseif( U_ > 2 )

        P = 0; K_ = 1;

        while( ~P )
    
            B_ = permn([0;1],M-1,K_);
            
            if( sum(B,2) == Q_ )
            
                P = P + 1;
    
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