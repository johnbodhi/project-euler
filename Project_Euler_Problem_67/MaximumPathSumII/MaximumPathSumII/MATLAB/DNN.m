function [B_,STL_(J_),STU_(J_),SP_,SPNC_,SPC_] = DNN(I_,J_,B_,STL_,STU_,SPNC_,SPC_,SP_)

    N_ = size(STL_,1); M_ = size(STU_,1);

    for I_ = N_    
        for J_ = STL_(I_):1:STU_(I_)
                                 
            [B_,STL_,STU_,SP_,SPNC_,SPC_] = bitCoffee(B_,STL_,STU_,SP_,SPNC_,SPC_);          
        end
    end