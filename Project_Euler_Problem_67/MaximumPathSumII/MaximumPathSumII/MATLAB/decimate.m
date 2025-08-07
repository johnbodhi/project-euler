function [ RA_,RAF_,RS_,RSF_ ] = decimate(RA_, RAF_, RS_, RSF_ )

    % Cut and unjoin each slice of each trellis to flip and swap in the
    % contraction. We transform each slice, and decimate contiguously 
    % until we achieve a many-one reduction.

    RA_  = circshift(RA_,1,1);
    RAF_ = flip(RA_,2);
    RAF_ = swap(RAF_);

    RS_  = circshift(RS_,1,1);    
    RSF_ = flip(RS_,2);
    RSF_ = swap(RSF_);


    

end