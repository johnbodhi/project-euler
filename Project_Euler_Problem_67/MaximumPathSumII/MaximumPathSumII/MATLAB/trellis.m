function [EXSPACE] = trellis()

    [R_]         = LTM()                     ;


    [D_]         = scaffold(R_)              ;

    [R_]         = mapLTM(R_,D_)             ;

    [R_]         = transform(R_)             ;


    [R_]         = decimate(R_)            ;

    
    save("NEXPSPACE.mat","NEXPSPACE_")       ;


    N_           = load("N_.mat")            ; 
    N_           = N_.N_                     ;


    NEXPSPACE    = load("NEXPSPACE.mat")     ;   
    NEXPSPACE    = NEXPSPACE.NEXPSPACE       ;