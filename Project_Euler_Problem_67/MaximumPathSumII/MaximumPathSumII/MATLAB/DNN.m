function [ B_, STL_, STU_, SP_ ] = DNN( N_, Q_, B_, STL_, STU_, SP_ )

        INF = 10; SUP = 10; C = zeros(1,INF+SUP+N_);

        C(1:size(B_,1),INF+1:1:N_+SUP-1) = B_;
        
        % The convolutional length is the same for each observation in a
        % complete linear dyadic search. We can learn different boundaries
        % for different models with different combinations.
        
        for jam = STT_(13):1:N_-14
    
            [ B_, SP_ ] = bitCoffee( jam, B_, SP_ );
    
            if( sum(B_) == Q_ )
    
                return
            end
    
            for jal = STT_(12):1:N_-13
    
                [ B_, SP_ ] = bitCoffee( jal, B_, SP_ );
    
                if( sum(B_) == Q_ )
    
                    return
                end
    
                for jak = STT_(11):1:N_-12
    
                    [ B_, SP_ ] = bitCoffee( jak, B_, SP_ );
    
                    if( sum(B_) == Q_ )
    
                        return
                    end
    
                    for jaj = STT_(10):1:N_-11
    
                        [ B_, SP_ ] = bitCoffee( jaj, B_, SP_ );
    
                        if( sum(B_) == Q_ )
    
                            return
                        end
    
                        for jai = STT_(9):1:N_-10
    
                            [ B_, SP_ ] = bitCoffee( jai, B_, SP_ );
    
                            if( sum(B_) == Q_ )
    
                                return
                            end
    
                            for jah = STT_(8):1:N_-9
    
                                [ B_, SP_ ] = bitCoffee( jah, B_, SP_ );
    
                                if( sum(B_) == Q_ )
    
                                    return
                                end
    
                                for jag = STT_(7):1:N_-8
    
                                    [ B_, SP_ ] = bitCoffee( jag, B_, SP_ );
    
                                    if( sum(B_) == Q_ )
    
                                        return
                                    end
    
                                    for jaf = STT_(6):1:N_-7
    
                                        [ B_, SP_ ] = bitCoffee( jaf, B_, SP_ );
    
                                        if( sum(B_) == Q_ )
    
                                            return
                                        end
    
                                        for jae = STT_(5):1:N_-6
    
                                            [ B_, SP_ ] = bitCoffee( jae, B_, SP_ );
    
                                            if( sum(B_) == Q_ )
    
                                                return
                                            end
    
                                            for jad = STT_(4):1:N_-5
    
                                                [ B_, SP_ ] = bitCoffee( jad, B_, SP_ );
    
                                                if( sum(B_) == Q_ )
    
                                                    return
                                                end
    
                                                for jac = STT_(3):1:N_-4 
    
                                                    [ B_, SP_ ] = bitCoffee( jac, B_, SP_ );
    
                                                    if( sum(B_) == Q_ )
    
                                                        return
                                                    end
    
                                                    for jab = STL_(2):1:STU_(2)
    
                                                        [ B_, SP_ ] = bitCoffee( jab, B_, SP_ );
    
                                                        if ( sum(C,2) <= ceil(Q_/4) )
                                         
                                                            return
                                                        end    
    
                                                        for jaa = STL_(1):1:STU_(1)
    
                                                            % Extend to MOD_ > 1 -> [0,...,N]   
                                                            
                                                            % Extend the objective function SP_ slices as minimizer: 
                                                            % bit position, bit value, bit accumulator, bit index, 
                                                            % convolutional range values, convolutional range
                                                            % indexes, vector nest index, 
                                                            % vector nest column operation output values...
    
                                                            [ B_, SP_ ] = bitCoffee( jaa, C, SP_ );                                                                                                                                                                                                                
    
                                                            if ( sum(C,2) <= ceil(Q_/4) )
                                         
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