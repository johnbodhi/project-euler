function [R_] = trellis()

    [R_]    = LTM()          ;

    [D_]    = scaffold(R_)   ;

    [R_]    = mapLTM(R_,D_)  ;

    [R_]    = transform(R_)  ;

    [R_]    = decimate(R_)   ;

    save("R_.mat","R_")      ;
    
    R_      = load("R_.mat") ;
    R_      = R_.R_          ;