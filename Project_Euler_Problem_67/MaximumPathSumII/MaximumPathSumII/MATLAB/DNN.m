function [B_,SP_,STL_,STU_] = DNN(B_,SP_,STL_,STU_)

    
    for jah = STL_(8):1:STU_(8)

        [B_,SP_] = bitCoffee(B_,SP_);
    
        for jag = STL_(7):1:STU_(7)

            [B_,SP_] = bitCoffee(B_,SP_);
    
            for jaf = STL_(6):1:STU_(6)

                [B_,SP_] = bitCoffee(B_,SP_);
        
                for jae = STL_(5):1:STU_(5)

                    [B_,SP_] = bitCoffee(B_,SP_);
        
                    for jad = STL_(4):1:STU_(4)

                        [B_,SP_] = bitCoffee(B_,SP_);
        
                        for jac = STL_(3):1:STU_(3)

                            [B_,SP_] = bitCoffee(B_,SP_);
        
                            for jab = STL_(2):1:STU_(2)

                                [B_,SP_] = bitCoffee(B_,SP_);
        
                                for jaa = STL_(1):1:STU_(1)
                                                         
                                    [B_,SP_] = bitCoffee(B_,SP_);
                                    
                                end
                            end
                        end
                    end
                end
            end
        end
    end
