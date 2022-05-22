        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:57 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IPINP__genmod
          INTERFACE 
            SUBROUTINE IPINP(LINE,MA,LA,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              CHARACTER(LEN=1), INTENT(IN) :: LINE(LB)
              INTEGER(KIND=4), INTENT(INOUT) :: MA
              INTEGER(KIND=4), INTENT(IN) :: LA
            END SUBROUTINE IPINP
          END INTERFACE 
        END MODULE IPINP__genmod
