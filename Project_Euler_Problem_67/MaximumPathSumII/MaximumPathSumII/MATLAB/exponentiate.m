function [R_] = exponentiate(R_)

    RE_         = R_                          ;

    R_(:,:,:,1) = RE_(:,:,:,1)                ;
    R_(:,:,:,2) = swap(R_(:,:,:,1),1)         ; 
    R_(:,:,:,3) = smudge(flip(R_(:,:,:,2),2)) ; 
    R_(:,:,:,4) = swap(R_(:,:,:,3),1)         ;

    R_(:,:,:,5) = RE_(:,:,:,2)                ;
    R_(:,:,:,6) = swap(R_(:,:,:,5),1)         ;
    R_(:,:,:,7) = smudge(flip(R_(:,:,:,6),2)) ;
    R_(:,:,:,8) = swap(R_(:,:,:,7),1)         ;

    for k = 1:1:size(R_,3)
        for l = 1:1:size(R_,4)

            RT_(:,:,l,k) = R_(:,:,k,l)                                    ;
        end
    end
    R_ = RT_                                                              ;

    M_ = size(R_,2)                                                       ;
    for l = size(R_,4):-1:2
        ii = l-1; jj = ii;
        for k = size(R_,3):-1:1
            for j = M_:-1:floor(M_-jj)
                
                R_(:,j,k,l) = circshift(R_(:,j,k,l),-ii,1)                ;
                ii          = ii - 1;
            end
            ii = l-1; jj = ii;
        end
    end
    
    for l = size(R_,4):-1:1
        for k = size(R_,3):-1:1
            
            RT_(:,:,k,l) = R_(1:ceil(M_/2),1:ceil(M_/2),k,l)              ;

            if ( ~mod(M_,2) )

                RB_(:,:,k,l) = R_(1:ceil(M_/2),ceil(M_/2)+1:M_,k,l)       ;
            else

                RB_(:,:,k,l) = R_(1:ceil(M_/2),ceil(M_/2):M_,k,l)         ;
            end

            RT_(:,:,k,l) = RT_(:,:,k,l)'                                  ;
            RB_(:,:,k,l) = flip(RB_(:,:,k,l),2)'                          ;
                            
            if ( mod(M_,2) )
                 
                RB_(ceil(M_/2),:,k,l) = 0                                 ;
            end
        end
    end

    R_            = zeros(ceil(M_/2),ceil(M_/2),ceil(M_/2),ceil(M_/2),2)  ;
    R_(:,:,:,:,1) = RT_                                                   ;
    R_(:,:,:,:,2) = RB_                                                   ;
    
    % save("R_.mat","R_");
    % R_ = load("R_.mat");
    % R_ = R_.R_         ;