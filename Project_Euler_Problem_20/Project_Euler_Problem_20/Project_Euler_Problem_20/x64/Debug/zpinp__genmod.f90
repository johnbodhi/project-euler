        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:34:48 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ZPINP__genmod
          INTERFACE 
            SUBROUTINE ZPINP(LINE,MA,LA,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              CHARACTER(LEN=1), INTENT(IN) :: LINE(LB)
              INTEGER(KIND=4), INTENT(INOUT) :: MA(2)
              INTEGER(KIND=4), INTENT(IN) :: LA
            END SUBROUTINE ZPINP
          END INTERFACE 
        END MODULE ZPINP__genmod
