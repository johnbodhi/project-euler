function [B_,SP_,SPNC_,SPC_,STL_(J_),STU_(J_)] = DNN(B_,STL_,STU_,SP_,SPNC_,SPC_)

    for I_ = 
        
        for J_ = STL_(I_):1:STU_(I_)
                                 
            [B_,SP_,SPNC_,SPC_] = bitCoffee(J_,B_,STL_,STU_,SP_,SPNC_,SPC_)       ;
            
        end

    end