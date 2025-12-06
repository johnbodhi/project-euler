function [B_,SP_,STL_,STU_] = DNN(B_,SP_,STL_,STU_)


    for j = STL_(2):1:STU_(2) 
        
        for i = STL_(1,j):1:STU_(1,j)
                                 
            [B_,SP_] = bitCoffee(B_,SP_);
           
        end

    end
