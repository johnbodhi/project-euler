function [ F_, E_ ] = histogram( B_, F_, E_ )

    for i = 1:1:size(B_,1)

        for j = 1:1:size(B_,2)
        
            if( B_(i,j) )

                F_(i,j) = F_(i,j) + 1;

            end

        end 

    end

    E_(1,sum(B_,2)+1) = E_(1,sum(B_,2)+1) + 1;

end