function [RA_,RS_] = mapScaffold(A_,D_)

    N_ = size(A_,1);

    [AS_] = swap(A_,1); 

    A_ = A_'; 
    
    AS_ = AS_';

    RA_  = zeros(N_,N_,ceil(N_/2));
    RS_  = zeros(N_,N_,ceil(N_/2));

    for k = 1:1:ceil(N_/2)
        for j = 1:1:N_
            for i = 1:1:N_
                if(D_(i,j,k))

                    RA_(i,j,k) = A_ (D_(i,j,k),j);   
                    RS_(i,j,k) = AS_(D_(i,j,k),j);                  
                end   
            end
        end
    end   