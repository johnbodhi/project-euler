        !COMPILER-GENERATED INTERFACE MODULE: Mon Aug  9 10:11:37 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IMINP__genmod
          INTERFACE 
            SUBROUTINE IMINP(LINE,MA,LA,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              CHARACTER(LEN=1), INTENT(IN) :: LINE(LB)
              INTEGER(KIND=4), INTENT(INOUT) :: MA
              INTEGER(KIND=4), INTENT(IN) :: LA
            END SUBROUTINE IMINP
          END INTERFACE 
        END MODULE IMINP__genmod
