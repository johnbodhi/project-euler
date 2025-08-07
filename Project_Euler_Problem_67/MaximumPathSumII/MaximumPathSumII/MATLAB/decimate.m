function [ NEXPSPACE_ ] = decimate(D_)

    % The next fold is a column-wise decimation and a sequence of flips as
    % seen previously.  This reduces the necessary number of binary directives to a
    % quarter of what was needed before the folds, as weel shortens the directive lengths
    % for a convolutional p-adic decision tree process ( two trees ).

    % Cut and unjoin each slice of each trellis to flip and swap in the
    % contraction. We transform each slice, and decimate contiguously 
    % until we achieve a many-one reduction in exponential space, and
    % exponential time.

    RA  = zeros(N,M);
    RS  = zeros(N,M);
    
    for k = 1:ceil(size(D_,3)/2)
        for j = 1:size(D_,2)
            for i = 1:size(D_,1)     
                if(D_(i,j,k))
    
                    RA(i,j,k) = A(D_(i,j,k),j);
    
                    RS(i,j,k) = AS(D_(i,j,k),j);
                end   
            end
        end
    end
    
    RA_      = circshift(RA_,1,1);
    RAF_     = flip(RA_,2);
    RAF_     = swap(RAF_);
    
    RS_      = circshift(RS_,1,1);    
    RSF_     = flip(RS_,2);
    RSF_     = swap(RSF_);
    
    [ A, B ] = decompose( A, B );