function [ F_, E_ ] = histogram( B_, F_, K_ )

    for i = 1:1:size(B_,1)

        for j = 1:1:size(B_,2)
        
            if( B_(i,j) )

                F_(1,j) = F_(1,j) + 1;

            end

        end 

    end

    F_(2,sum(B_,2)+1) = F_(2,sum(B_,2)+1) + 1; 
    
    % F_(1,:) = F_(1,:) ./ K_;
    % F_(2,:) = F_(2,:) ./ sum(F_(2,:),2);

end