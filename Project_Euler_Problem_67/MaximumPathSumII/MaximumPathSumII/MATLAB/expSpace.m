function [R_] = expSpace()

    [R_]    = LTM()              ;

    while ( N_ ~= OPT )
        
        [D_]    = trellis(R_)    ;
    
        [R_]    = mapping(R_,D_) ;
    
        [R_]    = transform(R_)  ;
    
        [R_]    = decimate(R_)   ;

        [R_]    = lagrangians(R_)      ;

    end

    % save("R_.mat","R_")      ;
    % R_      = load("R_.mat") ;
    % R_      = R_.R_          ;