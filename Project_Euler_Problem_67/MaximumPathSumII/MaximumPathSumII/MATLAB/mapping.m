function [R_] = mapping(G_,D_)
                     
    N_               = size(G_,1)                                  ;

    for n = 1:1:size(G_,6)
        for m = 1:1:size(G_,5)
            for l = 1:1:size(G_,4) 
                for k = 1:1:size(G_,3)
        
                    RA(:,:)  = G_(:,:,k,l,m,n)                     ;     
                    RS(:,:)  = swap(RA,2)                          ;
                                     
                    RA(:,:)  = RA(:,:)'                            ;
                    RS(:,:)  = RS(:,:)'                            ;
                
                    RA_(:,:,:) = zeros(N_,N_,ceil(N_/2))           ;
                    RS_(:,:,:) = zeros(N_,N_,ceil(N_/2))           ;     
            
                    for k = 1:1:ceil(N_/2)
                        for j = 1:1:N_
                            for i = 1:1:N_
                                if(D_(i,j,k))
                                                                  
                                    RA_(i,j,k) = RA(D_(i,j,k),j)   ;   
                                    RS_(i,j,k) = RS(D_(i,j,k),j)   ;                
                                end   
                            end
                        end
                    end            
                    RL_(:,:,:,k,l,m,n)  = RA_(:,:,:)               ;
                    RR_(:,:,:,k,l,m,n)  = RS_(:,:,:)               ; 

                end                
            end
        end   
    end
    R_(:,:,:,:,:,:,1) = RL_                                        ;
    R_(:,:,:,:,:,:,2) = RR_                                        ;
  