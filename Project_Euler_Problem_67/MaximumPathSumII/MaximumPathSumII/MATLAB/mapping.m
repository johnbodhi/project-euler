function [RL_,RR_] = mapping(G_,D_)
                     
    N_             = size(G_,1)                           ;
    M_             = size(G_,4)                           ;
    P_             = size(G_,5)                           ;

    for m = 1:1:P_
        for l = 1:1:M_
    
            RA(:,:,:) = G_(:,:,:,l,m)                     ;    
            RS(:,:,:) = swap(RA,2)                        ;
                             
            RA(:,:,:) = pagetranspose(RA)                 ;
            RS(:,:,:) = pagetranspose(RS)                 ;
        
            RA_  = zeros(N_,N_,ceil(N_/2))                ;
            RS_  = zeros(N_,N_,ceil(N_/2))                ;     
    
            for k = 1:1:ceil(N_/2)
                for j = 1:1:N_
                    for i = 1:1:N_
                        if(D_(i,j,k))
                                                          
                            RA_(i,j,k) = RA(D_(i,j,k),j)  ;   
                            RS_(i,j,k) = RS(D_(i,j,k),j)  ;                
                        end   
                    end
                end
            end            
            RL_(:,:,:,l,m) = RA_                          ;
            RR_(:,:,:,l,m) = RS_                          ;
            
        end
    end