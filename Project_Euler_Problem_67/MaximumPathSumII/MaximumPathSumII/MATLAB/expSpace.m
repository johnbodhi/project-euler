function [R_] = expSpace()

    [R_]    = LTM()                  ;

    for l = 1:1:size(R_,4)

        for k = 1:1:size(R_,3)

            [D_]    = trellis(R_)    ;
        
            [R_]    = mapping(R_,D_) ;
        
            [R_]    = transform(R_)  ;
        
            [R_]    = decimate(R_)   ;

        end
    end

    % save("R_.mat","R_")      ;
    % R_      = load("R_.mat") ;
    % R_      = R_.R_          ;