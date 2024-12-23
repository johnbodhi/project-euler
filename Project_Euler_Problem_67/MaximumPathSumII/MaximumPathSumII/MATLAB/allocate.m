function [ F_, E_ ] = allocate( B_ )

    DATARANGE = size(B_,2);

    F_ = zeros(1,DATARANGE); E_ = zeros(1,DATARANGE);

end