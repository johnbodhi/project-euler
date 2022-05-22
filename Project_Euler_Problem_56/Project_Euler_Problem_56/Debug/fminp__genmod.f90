        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 11:15:53 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMINP__genmod
          INTERFACE 
            SUBROUTINE FMINP(LINE,MA,LA,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              CHARACTER(LEN=1), INTENT(IN) :: LINE(LB)
              INTEGER(KIND=4), INTENT(INOUT) :: MA
              INTEGER(KIND=4), INTENT(IN) :: LA
            END SUBROUTINE FMINP
          END INTERFACE 
        END MODULE FMINP__genmod
