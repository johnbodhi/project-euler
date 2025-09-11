function [R_] = transform(R_)

    RT_         = R_;

    R_(:,:,:,1) = RT_(:,:,:,1)                ;
    R_(:,:,:,2) = swap(R_(:,:,:,1),1)         ; 
    R_(:,:,:,3) = smudge(flip(R_(:,:,:,2),2)) ; 
    R_(:,:,:,4) = swap(R_(:,:,:,3),1)         ; 

    R_(:,:,:,5) = RT_(:,:,:,2)                ;
    R_(:,:,:,6) = swap(R_(:,:,:,5),1)         ;
    R_(:,:,:,7) = smudge(flip(R_(:,:,:,6),2)) ;
    R_(:,:,:,8) = swap(R_(:,:,:,7),1)         ;

    for k = 1:1:size(R_,3)
        for l = 1:1:size(R_,4)

            RT_(:,:,l,k) = R_(:,:,k,l);
        end
    end
    R_ = RT_; % save("R_.mat","R_")  ;
    
    R_ = load("R_.mat"); R_ = R_.R_;