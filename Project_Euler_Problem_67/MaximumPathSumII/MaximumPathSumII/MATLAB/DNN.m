function [ B_, STT_, SP_ ] = BNN( N_, Q_, B_, STT_, SP_ )


        INF = 10; SUP = 10; C = zeros(1,INF+SUP+N_);

        C(1,INF+1:1:SUP-1) = B_(3,:);

        [~, STT_] = find( B_(3,:), N_, 'last' );
        
        for jbx = 1:1:ciel(N_/2)
            for 
                for
                    for
                        for
                            for
                                for
                                    for
                                        for
                                            for
                                                for
                                                    for
                                                        for
                                                            for
                                                                for
                                                                    for
                                                                        for
                                                                            for
                                                                                for
                                                                                    for
                                                                                        for
                                                                                            for
                                                                                                for
                                                                                                    for
                                                                                                        for
                                                                                                            for
                                                                                                                for
                                                                                                                    for
                                                                                                                        for
                                                                                                                            for
                                                                                                                                for
                                                                                                                                    for
                                                                                                                                        for
                                                                                                                                            for
                                                                                                                                                for
                                                                                                                                                    for
                                                                                                                                                        for
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
                                                                                                                                                                                                    for jac = STT_(3):1:N_-3

                                                                                                                                                                                                        if( B_(3,jac) )
                                                                                                                                                                                                                    
                                                                                                                                                                                                              SP_( B_(3,jab), jab ) = SP_( B_(3,jab), jab ) + 1;

                                                                                                                                                                                                              B_(3,jab+1) = B_(3,jab);
                                                                                                                                                                                                              B_(3,jab  ) = SP_( B_(3,jab)+1,jab);

                                                                                                                                                                                                        elseif( ~B_(3,jaa) )

                                                                                                                                                                                                              B_(3,jab+1) = B_(3,jab);
                                                                                                                                                                                                              B_(3,jab  ) = 0;

                                                                                                                                                                                                        end

                                                                                                                                                                                                            for jab = STT_(2):1:N_-2
                                                                                                                                                                                                                
                                                                                                                                                                                                                if( B_(3,jab) )
                                                                                                                                                                                                                        
                                                                                                                                                                                                                      SP_( B_(3,jab), jab ) = SP_( B_(3,jab), jab ) + 1;
    
                                                                                                                                                                                                                      B_(3,jab+1) = B_(3,jab);
                                                                                                                                                                                                                      B_(3,jab  ) = SP_( B_(3,jab)+1,jab);
    
                                                                                                                                                                                                                elseif( ~B_(3,jaa) )
    
                                                                                                                                                                                                                      B_(3,jab+1) = B_(3,jab);
                                                                                                                                                                                                                      B_(3,jab  ) = 0;
    
                                                                                                                                                                                                                end                                                                                                                                                                                                                                                                                                                                                                                   
    
                                                                                                                                                                                                                    for jaa = STT_(1):1:N_-1
                                                                                                                                                                                                                          
                                                                                                                                                                                                                        if( B_(3,jaa) && ~SP(B_(3,:),jaa) && ~B_(3,jaa+1) && ~SP(B_(3,:),jaa+1)  )                                                                                                                                                                                             
                                                                                                                                                                                                    
                                                                                                                                                                                                                              B_(3,jaa+1) = B_(3,jaa);

                                                                                                                                                                                                                              B_(3,jaa)   = 0;

                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                              
                                                                                                                                                                                                                        elseif( B_(3,jaa) && SP(B_(3,:),jaa) && ~B_(3,jaa+1) && ~SP(B_(3,:),jaa+1))

                                                                                                                                                                                                                              [~,J] = find(SP_(:,jaa),1,'last');

                                                                                                                                                                                                                              SP_( B_(3,jaa), jaa ) = SP_( B_(3,jaa), jaa ) - 1;
        
                                                                                                                                                                                                                              B_(3,jaa+1) = B_(3,jaa);

                                                                                                                                                                                                                              B_(3,jaa  ) = J;

                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end

                                                                                                                                                                                                                        elseif( B_(3,jaa) && ~SP(B_(3,:),jaa) && ~B_(3,jaa+1) && SP(B_(3,:),jaa+1))

                                                                                                                                                                                                                              SP_( B_(3,jaa), jaa+1 ) = SP_( B_(3,jaa), jaa+1 ) + 1;

                                                                                                                                                                                                                              B_(3,jaa+1) = B_(3,jaa);

                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end

                                                                                                                                                                                                                        elseif( B_(3,jaa) && SP(B_(3,:),jaa) && ~B_(3,jaa+1) && SP(B_(3,:),jaa+1) )


                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end

                                                                                                                                                                                                                        elseif( B_(3,jaa) && ~SP(B_(3,:),jaa) && B_(3,jaa+1) && ~SP(B_(3,:),jaa+1))



                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                        
                                                                                                                                                                                                                        elseif( B_(3,jaa) && SP(B_(3,:),jaa) && B_(3,jaa+1) && ~SP(B_(3,:),jaa+1) )

                                                                                                                                                                                                                              SP_( B_(3,jaa), jaa+1 ) = SP_( B_(3,jaa), jaa+1 ) + 1;

                                                                                                                                                                                                                              B_(3,jaa+1) = B_(3,jaa);

                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end

                                                                                                                                                                                                                        elseif( B_(3,jaa) && ~SP(B_(3,:),jaa) && B_(3,jaa+1) && SP(B_(3,:),jaa+1) )



                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end

                                                                                                                                                                                                                        elseif( B_(3,jaa) && SP(B_(3,:),jaa) && B_(3,jaa+1) && SP(B_(3,:),jaa+1)  )   



                                                                                                                                                                                                                              if( sum(B_(3,:)) == Q )

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
                                                        end'
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


    
