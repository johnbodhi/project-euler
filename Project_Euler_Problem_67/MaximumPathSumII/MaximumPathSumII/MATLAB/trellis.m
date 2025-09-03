function [EXSPACE] = trellis()

    [A_]         = LTM()                     ;

    [D_]         = scaffold(A_)              ;

    [RAA_,RSA_]  = mapScaffold(A_,D_)        ;

    [R_]         = transform(RAA_,RSA_)      ;

    EXPSPACE     = decimate(R_)              ; 
    
    save("NEXPSPACE.mat","NEXPSPACE_")       ;

    N_           = load("N_.mat")            ; 
    N_           = N_.N_                     ;

    NEXPSPACE    = load("NEXPSPACE.mat")     ;    
    NEXPSPACE    = NEXPSPACE.NEXPSPACE       ;