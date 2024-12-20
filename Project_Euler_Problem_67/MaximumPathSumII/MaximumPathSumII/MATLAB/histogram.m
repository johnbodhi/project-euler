function [ F_, H_, E_ ] = histogram( B_, H_, E_ )

    DATARANGE = size(B_,2);

    F_ = zeros(1,DATARANGE); H_ = zeros(1,DATARANGE); E_ = zeros(1,DATARNAGE);
         
    for j = 0:1:DATARANGE

        for i = 1:1:size(B_,1)
        
            if( B_(i,j) )

                H_(i,j) = H_(i,j) + 1;

                F_(i,j) = H_(i,j);

            end

        end 

    end

    E_(1,sum(B_,2)) = E_(1,sum(B_,2)) + 1;

end