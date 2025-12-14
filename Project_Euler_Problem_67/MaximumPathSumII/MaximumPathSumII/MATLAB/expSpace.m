function [R_,F_] = expSpace( )

    [R_,OPT_]   = LTM()                      ;

    while ( ~OPT_ )

        [D_]          = trellis(R_)          ;
    
        [R_]          = map(R_,D_)       ;
    
        [R_]          = exponentiate(R_)     ;

        [F_,OPT_]     = optimize(R_)         ;
        
    end

    % save("R_.mat","R_")                      ;
    % R_      = load("R_.mat")                 ;
    % R_      = R_.R_                          ;  

    % save("F_.mat","F_")                      ;
    % F_      = load("F_.mat")                 ;
    % F_      = F_.F_                          ;  