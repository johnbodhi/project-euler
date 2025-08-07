function [ P_ ] = decimate(RA_,RS_)

    % Cut and unjoin each slice of each trellis to flip and swap in the
    % contraction. We transform each slice, and decimate contiguously 
    % until we achieve a many-one reduction in exponential space, and
    % exponential time.
    
    RA_  = circshift(RA_,1,1);
    RAF_ = flip(RA_,2);
    RAF_ = swap(RAF_);
    
    RS_  = circshift(RS_,1,1);    
    RSF_ = flip(RS_,2);
    RSF_ = swap(RSF_);
    
    