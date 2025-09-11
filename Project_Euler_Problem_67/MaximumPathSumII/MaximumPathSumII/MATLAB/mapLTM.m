function [R_] = mapLTM(R_,D_)
                     
    N_   = size(R_,1)             ; 
                     
    RS_  = swap(R_,2)             ;
                     
    R_   = R_'; RS_ = RS_'        ;
                         
    RA_  = zeros(N_,N_,ceil(N_/2));
    RS_  = zeros(N_,N_,ceil(N_/2));
                                   
    for k = 1:1:ceil(N_/2)
        for j = 1:1:N_
            for i = 1:1:N_
                if(D_(i,j,k))
                                                  
                    RA_(i,j,k) = R_ (D_(i,j,k),j);   
                    RS_(i,j,k) = RS_(D_(i,j,k),j);                 
                end   
            end
        end
    end
    R_(:,:,:,1) = RA_;
    R_(:,:,:,2) = RS_;

