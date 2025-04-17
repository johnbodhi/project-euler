function [ B_, STT_, SP_ ] = DNN( N_, Q_, B_, STT_, SP_ )

        % INF = 10; SUP = 10; C = zeros(1,INF+SUP+N_);
        % 
        % C(1,INF+1:1:SUP-1) = B_;
        
        for jbx = STT_(49):1:N_-50
            for jbw = STT_(48):1:N_-49
                for jbv = STT_(47):1:N_-48
                    for jbu = STT_(46):1:N_-47
                        for jbt = STT_(45):1:N_-46
                            for jbs = STT_(44):1:N_-45
                                for jbr = STT_(43):1:N_-44
                                    for jbq = STT_(42):1:N_-43
                                        for jbp = STT_(41):1:N_-42
                                            for jbo = STT_(40):1:N_-41
                                                for jbn = STT_(39):1:N_-40
                                                    for jbm = STT_(38):1:N_-39
                                                        for jbl = STT_(37):1:N_-38
                                                            for jbk = STT_(36):1:N_-37
                                                                for jbj = STT_(35):1:N_-36
                                                                    for jbi = STT_(34):1:N_-35
                                                                        for jbh = STT_(33):1:N_-34
                                                                            for jbg = STT_(32):1:N_-33
                                                                                for jbf = STT_(31):1:N_-32
                                                                                    for jbe = STT_(30):1:N_-31
                                                                                        for jbd = STT_(29):1:N_-30
                                                                                            for jbc = STT_(28):1:N_-29
                                                                                                for jbb = STT_(27):1:N_-28
                                                                                                    for jba = STT_(26):1:N_-27
                                                                                                        for jaz = STT_(25):1:N_-26
                                                                                                            for jay = STT_(24):1:N_-25
                                                                                                                for jax = STT_(23):1:N_-24
                                                                                                                    for jaw = STT_(22):1:N_-23
                                                                                                                        for jav = STT_(21):1:N_-22
                                                                                                                            for jau = STT_(20):1:N_-21
                                                                                                                                for jat = STT_(19):1:N_-20
                                                                                                                                    for jas = STT_(18):1:N_-19
                                                                                                                                        for jar = STT_(17):1:N_-18
                                                                                                                                            for jaq = STT_(16):1:N_-17
                                                                                                                                                for jap = STT_(15):1:N_-16
                                                                                                                                                    for jao = STT_(14):1:N_-15
                                                                                                                                                        for jan = STT_(14):1:N_-14
                                                                                                                                                            for jam = STT_(13):1:N_-13
                                                                                                                                                                for jal = STT_(12):1:N_-12
                                                                                                                                                                    for jak = STT_(11):1:N_-11
                                                                                                                                                                        for jaj = STT_(10):1:N_-10
                                                                                                                                                                            for jai = STT_(9):1:N_-9
                                                                                                                                                                                for jah = STT_(8):1:N_-8
                                                                                                                                                                                    for jag = STT_(7):1:N_-7
                                                                                                                                                                                        for jaf = STT_(6):1:N_-6
                                                                                                                                                                                            for jae = STT_(5):1:N_-5
                                                                                                                                                                                                for jad = STT_(4):1:N_-4

                                                                                                                                                                                                    [ B_ ] = bitCoffee( jad, B_, SP_ );

                                                                                                                                                                                                    if( sum(B_) == Q_ )
                                                                                                                                                                                                    
                                                                                                                                                                                                        return
                                                                                                                                                                                                    end

                                                                                                                                                                                                    for jac = STT_(3):1:N_-3 

                                                                                                                                                                                                        [ B_ ] = bitCoffee( jac, B_, SP_ );

                                                                                                                                                                                                        if( sum(B_) == Q_ )
                                                                                                                                                                                                        
                                                                                                                                                                                                            return
                                                                                                                                                                                                        end

                                                                                                                                                                                                        for jab = STT_(2):1:N_-2

                                                                                                                                                                                                            [ B_ ] = bitCoffee( jab, B_, SP_ );

                                                                                                                                                                                                            if( sum(B_) == Q_ )
                                                                                                                                                                                                            
                                                                                                                                                                                                                return
                                                                                                                                                                                                            end
                                                                                                                                                                                                            
                                                                                                                                                                                                            for jaa = STT_(1):1:N_-1
                                                                                                                                                                                                            
                                                                                                                                                                                                                [ B_ ] = bitCoffee( jaa, B_, SP_ );

                                                                                                                                                                                                                if( sum(B_) == Q_ )
                                                                                                                                                                                                                
                                                                                                                                                                                                                    return
                                                                                                                                                                                                                end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end



end


    
