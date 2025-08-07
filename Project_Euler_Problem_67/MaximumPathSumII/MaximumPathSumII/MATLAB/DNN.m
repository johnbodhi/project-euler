function [ B_, STL_, STU_, SP_ ] = DNN( N_, Q_, B_, STL_, STU_, SP_ )

        INF = 10; SUP = 10; C = zeros(1,INF+SUP+N_);

        C(1,INF+1:ceil(Q_/2)) = B_;
        
        % The convolutional length is the same for each observation in a
        % complete linear dyadic search. We can learn different boundaries
        % for different models with different combinations.
        
        for jam = STL_(13):1:STU_(13)
    
            [ B_, SP_ ] = bitCoffee( jam, B_, SP_ );
    
            if( sum(C,2) <= ceil(Q_/2) )
    
                return
            end
    
            for jal = STL_(12):1:STU_(12)
    
                [ B_, SP_ ] = bitCoffee( jal, B_, SP_ );
    
                if( sum(C,2) <= ceil(Q_/2) )
    
                    return
                end
    
                for jak = STL_(11):1:STU_(11)
    
                    [ B_, SP_ ] = bitCoffee( jak, B_, SP_ );
    
                    if( sum(C,2) <= ceil(Q_/2) )
    
                        return
                    end
    
                    for jaj = STL_(10):1:STU_(10)
    
                        [ B_, SP_ ] = bitCoffee( jaj, B_, SP_ );
    
                        if( sum(C,2) <= ceil(Q_/2) )
    
                            return
                        end
    
                        for jai = STL_(9):1:STU_(9)
    
                            [ B_, SP_ ] = bitCoffee( jai, B_, SP_ );
    
                            if( sum(C,2) <= ceil(Q_/2) )
    
                                return
                            end
    
                            for jah = STL_(8):1:STU_(8)
    
                                [ B_, SP_ ] = bitCoffee( jah, B_, SP_ );
    
                                if( sum(C,2) <= ceil(Q_/2) )
    
                                    return
                                end
    
                                for jag = STL_(7):1:STU_(7)
    
                                    [ B_, SP_ ] = bitCoffee( jag, B_, SP_ );
    
                                    if( sum(C,2) <= ceil(Q_/2) )
    
                                        return
                                    end
    
                                    for jaf = STL_(6):1:STU_(6)
    
                                        [ B_, SP_ ] = bitCoffee( jaf, B_, SP_ );
    
                                        if( sum(C,2) <= ceil(Q_/2) )
    
                                            return
                                        end
    
                                        for jae = STL_(5):1:STU_(5)
    
                                            [ B_, SP_ ] = bitCoffee( jae, B_, SP_ );
    
                                            if( sum(C,2) <= ceil(Q_/2) )
    
                                                return
                                            end
    
                                            for jad = STL_(4):1:STU_(4)
    
                                                [ B_, SP_ ] = bitCoffee( jad, B_, SP_ );
    
                                                if( sum(C,2) <= ceil(Q_/2) )
    
                                                    return
                                                end
    
                                                for jac = STL_(3):1:STU_(3)
    
                                                    [ B_, SP_ ] = bitCoffee( jac, B_, SP_ );
    
                                                    if( sum(C,2) <= ceil(Q_/2) )
    
                                                        return
                                                    end
    
                                                    for jab = STL_(2):1:STU_(2)
    
                                                        [ B_, SP_ ] = bitCoffee( jab, B_, SP_ );
    
                                                        if ( sum(C,2) <= ceil(Q_/2) )
                                         
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
    
                                                            if ( sum(C,2) <= ceil(Q_/2) )
                                         
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