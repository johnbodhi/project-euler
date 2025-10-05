function [R_] = expSpace( )

    [R_]    = LTM()                    ;

    while ( ~OPT )
        
        [D_]    = trellis(R_)          ;
    
        [R_]    = mapping(R_,D_)       ;
    
        [R_]    = transform(R_)        ;
    
        [R_]    = decimate(R_)         ;

        [R_]    = parameterize(R_)     ;

        [OPT]   = optimum(R_)          ;

    end

    % save("R_.mat","R_")              ;
    % R_      = load("R_.mat")         ;
    % R_      = R_.R_                  ;