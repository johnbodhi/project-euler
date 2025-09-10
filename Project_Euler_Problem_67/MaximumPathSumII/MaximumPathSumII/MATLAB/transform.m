function [R_] = transform(RAA_,RSA_)

    RAB_ = swap(RAA_,1)        ; RSB_ = swap(RSA_,1)        ;
    RAC_ = smudge(flip(RAA_,2)); RSC_ = smudge(flip(RSA_,2));
    RAD_ = swap(RAC_,1)        ; RSD_ = swap(RSC_,1)        ;

    R_(:,:,:,1)  = RAA_        ; R_(:,:,:,5)  = RSA_        ;
    R_(:,:,:,2)  = RAB_        ; R_(:,:,:,6)  = RSB_        ;
    R_(:,:,:,3)  = RAC_        ; R_(:,:,:,7)  = RSC_        ;
    R_(:,:,:,4)  = RAD_        ; R_(:,:,:,8)  = RSD_        ;

    for k = 1:1:size(R_,3)
        for l = 1:1:size(R_,4)

            RT_(:,:,l,k) = R_(:,:,k,l);
        end
    end
    R_ = RT_; save("R_.mat","R_")  ;

    R_ = load("R_.mat"); R_ = R_.R_;