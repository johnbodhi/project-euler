function [R_] = exponentiate(R_)

    REL_(:,:,:,:,:)         = R_(:,:,:,:,:,1)                                     ;
    RER_(:,:,:,:,:)         = R_(:,:,:,:,:,2)                                     ;
    nm                      = 1                                                   ;

    for m = 1:1:size(R_,5)        
        for n = 1:1:size(R_,4)

            G_(:,:,:,1) = REL_(:,:,:,n,m)                                         ;
            G_(:,:,:,2) = swap(G_(:,:,:,1),1)                                     ; 
            G_(:,:,:,3) = smudge(flip(G_(:,:,:,2),2))                             ; 
            G_(:,:,:,4) = swap(G_(:,:,:,3),1)                                     ;
        
            G_(:,:,:,5) = RER_(:,:,:,n,m)                                         ;
            G_(:,:,:,6) = swap(G_(:,:,:,5),1)                                     ;
            G_(:,:,:,7) = smudge(flip(G_(:,:,:,6),2))                             ;
            G_(:,:,:,8) = swap(G_(:,:,:,7),1)                                     ;
        
            for k = 1:1:size(G_,3)
                for l = 1:1:size(G_,4)
        
                    RT_(:,:,l,k) = G_(:,:,k,l)                                    ;
                end
            end
            G_ = RT_                                                              ;
            
            N_ = size(G_,1)                                                       ;
            M_ = size(G_,2)                                                       ; 

            for l = size(G_,4):-1:2
                ii = l-1; jj = ii;
                for k = size(G_,3):-1:1
                    for j = M_:-1:floor(M_-jj)
                        
                        G_(:,j,k,l) = circshift(G_(:,j,k,l),-ii,1)                ;
                        ii          = ii - 1                                      ;
                    end
                    ii = l-1; jj = ii;
                end
            end
            
            for l = size(G_,4):-1:1
                for k = size(G_,3):-1:1
                    
                    RT_(:,:,k,l) = G_(1:ceil(M_/2),1:ceil(M_/2),k,l)              ;
        
                    if ( ~mod(M_,2) )
        
                        RB_(:,:,k,l) = G_(1:ceil(M_/2),ceil(M_/2)+1:M_,k,l)       ;
                    else
        
                        RB_(:,:,k,l) = G_(1:ceil(M_/2),ceil(M_/2):M_,k,l)         ;
                    end
        
                    RT_(:,:,k,l) = RT_(:,:,k,l)'                                  ;
                    RB_(:,:,k,l) = flip(RB_(:,:,k,l),2)'                          ;
                                    
                    if ( mod(M_,2) )
                         
                        RB_(ceil(M_/2),:,k,l) = 0                                 ;
                    end

                end
            end

            if( nm <= 1 )

                P_          = N_ * M_                                             ;        
                RL_         = zeros(ceil(N_/2),ceil(M_/2),ceil(N_/2),8,P_ )       ;
                RR_         = zeros(ceil(N_/2),ceil(M_/2),ceil(N_/2),8,P_ )       ;
            end

            RL_(:,:,:,:,nm) = RT_                                                 ; 
            RR_(:,:,:,:,nm) = RB_                                                 ;
            nm              = nm + 1                                              ;

        end   
    end
    R_(:,:,:,:,:,1) = RL_                                                         ;
    R_(:,:,:,:,:,2) = RR_                                                         ;
    
    % save("R_.mat","R_");
    % R_ = load("R_.mat");
    % R_ = R_.R_         ;