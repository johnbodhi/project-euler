function [Y_] = smudge(X_)

    for k = size(X_,3):-1:1
        for j = 1:1:size(X_,2)

            N_ = abs(k-size(find(X_(:,j,k)),1));
            
            if( N_ < k && j < k )
            
                X_(:,j,k) = circshift(X_(:,j,k),-N_,1);
            
            elseif( N_ < k && j > k )
            
                X_(:,j,k) = circshift(X_(:,j,k),N_,1);
            end
        end
    end
    Y_ = X_;
