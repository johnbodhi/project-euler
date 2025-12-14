function [B_,STL_(J_,K_),STU_(J_,K_),SP_,SPNC_,SPC_] = DNN(B_,STL_,STU_,SPNC_,SPC_,SP_)

    N_ = size(STL_,1); 
    
    M_ = size(STU_,1);

    for K_ = 1:1:M_
        for J_ = 1:1:N_    
            for I_ = STL_(J_,K_):1:STU_(J_,K_)
                                     
                [B_,STL_,STU_,SP_,SPNC_,SPC_]    = bitCoffee(B_,STL_,STU_,SP_,SPNC_,SPC_);          
            end
        end
    end