function [B_,SP_,STL_,STU_] = DNN(B_,SP_,STL_,STU_)


    for jah = STL_(2):1:STU_(2) 
        
        for jaa = STL_(1):1:STU_(1)
                                 
            [B_,SP_] = bitCoffee(B_,SP_);

           
        end

    end
