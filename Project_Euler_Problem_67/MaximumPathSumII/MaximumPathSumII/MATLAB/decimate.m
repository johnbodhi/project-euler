function [ NEXPSPACE_ ] = decimate(A_,AS_,D_,N_)

    % The next fold is a column-wise decimation and a sequence of flips as
    % seen previously.  This reduces the necessary number of binary directives to a
    % quarter of what was needed before the folds, as weel shortens the directive lengths
    % for a convolutional p-adic decision tree process ( two trees ).

    % Cut and unjoin each slice of each trellis to flip and swap in the
    % contraction. We transform each slice, and decimate contiguously 
    % until we achieve a many-one reduction in exponential space, and
    % exponential time.

    % Decimation is a unitary procedure...

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
    
    RA        = circshift(RA,1,1);
    RAF       = flip(RA,2);
    RAF       = swap(RAF);
    
    RS        = circshift(RS,1,1);   
    RSF       = flip(RS,2);
    RSF       = swap(RSF);


    
end

   