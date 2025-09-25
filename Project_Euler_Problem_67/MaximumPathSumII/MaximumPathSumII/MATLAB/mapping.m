function [R_] = mapping(R_,D_)
                     
    N_        = size(R_,1)         ; 

    RA(:,:,1) = R_                 ; 
    
    RS(:,:,1) = swap(R_,2)         ;
                     
    RA(:,:,1) = RA(:,:,1)'         ; 
    RS(:,:,1) = RS(:,:,1)'         ;

    RA_  = zeros(N_,N_,ceil(N_/2)) ;
    RS_  = zeros(N_,N_,ceil(N_/2)) ;                   
    for k = 1:1:ceil(N_/2)
        for j = 1:1:N_
            for i = 1:1:N_
                if(D_(i,j,k))
                                                  
                    RA_(i,j,k) = RA(D_(i,j,k),j);   
                    RS_(i,j,k) = RS(D_(i,j,k),j);                
                end   
            end
        end
    end
    R_          = zeros(N_,N_,ceil(N_/2),2);
    R_(:,:,:,1) = RA_                      ;
    R_(:,:,:,2) = RS_                      ;

