function [ F_ ] = allocate( B_ )

    DATARANGE = size(B_,2);

    F_ = zeros(size(B_,1),DATARANGE);
end