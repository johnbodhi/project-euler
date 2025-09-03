function [R_] = transform(RAA_,RSA_)

    RAB_ = flip(RAA_,2); RSB_ = flip(RSA_,2);
    RAC_ = smudge(RAB_); RSC_ = smudge(RSB_);
    RAD_ = swap(RAC_,1); RSD_ = swap(RSC_,1);
    RAE_ = swap(RAD_,2); RSE_ = swap(RSD_,2);

    R_(:,:,:,1)  = RAA_; R_(:,:,:,2)  = RSA_;
    R_(:,:,:,3)  = RAB_; R_(:,:,:,4)  = RSB_;
    R_(:,:,:,5)  = RAC_; R_(:,:,:,6)  = RSC_;
    R_(:,:,:,7)  = RAD_; R_(:,:,:,8)  = RSD_;
    R_(:,:,:,9)  = RAE_; R_(:,:,:,10) = RSE_;