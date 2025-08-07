function [ NEXPSPACE_ ] = decimate(A_,AS_,D_,N_)

    RA  = zeros(N_,N_);
    RS  = zeros(N_,N_);
    
    for k = 1:1:ceil(N_/2)
        for j = 1:1:N_
            for i = 1:1:N_     
                if(D_(i,j,k))
    
                    RA(i,j,k) = A_(D_(i,j,k),j) ;    
                    RS(i,j,k) = AS_(D_(i,j,k),j);                    
                end   
            end
        end
    end   

    RAF = flip(RA,2); 
    RAF = swap(RAF) ;
    
    RSF = flip(RS,2); 
    RSF = swap(RSF) ; 

end   