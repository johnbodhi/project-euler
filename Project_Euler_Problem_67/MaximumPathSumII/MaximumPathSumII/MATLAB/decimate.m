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

    for k = 2:1:ceil(N_/2)
        ii = -k+1;
        for j = N_:-1:N_-k+2

            RA(:,j,k) = circshift(RA(:,j,k),ii);
            RS(:,j,k) = circshift(RS(:,j,k),ii);
            ii = ii + 1;
        end        
    end

    RAF = flip(RA,2); 
    RSF = flip(RS,2); 

    for k = 2:1:ceil(N_/2)
        for j = 2:1:N_-1
            
            I            = size(find(RAF(:,j,k)),1);
            RAF(1:I,j,k) = flip(RAF(1:I,j,k),1);
            RSF(1:I,j,k) = flip(RSF(1:I,j,k),1);
        end
    end

    

   
end   