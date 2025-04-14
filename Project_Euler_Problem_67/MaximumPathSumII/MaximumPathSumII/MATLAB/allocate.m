function [ B_, F_, STT_, SP_ ] = allocate( N_, Q_, MOD_, B_ )

    DATARANGE = size(B_,2);

    F_ = zeros(size(B_,1),DATARANGE);

    [ B_(3,1:Q_-1) ] = permn((MOD_:-1:0)', Q_-1, 1);

    [ STT_ ] = (1:1:Q_)'; SP_ = zeros(N_,1);
end