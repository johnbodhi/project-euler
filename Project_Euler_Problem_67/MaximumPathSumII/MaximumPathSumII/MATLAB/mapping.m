function [R_] = mapping(R_,D_)
                     
    N_            = size(R_,1)                ; 

    for l = 1:1:size(R_,4)

        RA(:,:,:) = R_(:,:,:,l)               ;    
        RS(:,:,:) = swap(RA,2)                ;
                         
        RA(:,:,:) = pagetranspose(RA)         ;
        RS(:,:,:) = pagetranspose(RS)         ;
    end

    RA_  = zeros(N_,N_,ceil(N_/2))            ;
    RS_  = zeros(N_,N_,ceil(N_/2))                   ;     

    for k = 1:1:ceil(N_/2)
        for j = 1:1:N_
            for i = 1:1:N_
                if(D_(i,j,k))
                                                  
                    RA_(i,j,k,h) = RA(D_(i,j,k),j,h);   
                    RS_(i,j,k,h) = RS(D_(i,j,k),j,h);                
                end   
            end
        end
    end

    R_          = zeros(N_,N_,ceil(N_/2),2)           ;
    R_(:,:,:,1) = RA_                                 ;
    R_(:,:,:,2) = RS_                                 ;