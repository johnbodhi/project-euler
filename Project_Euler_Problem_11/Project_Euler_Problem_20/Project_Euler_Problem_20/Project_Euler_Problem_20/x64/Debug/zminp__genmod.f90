        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:34:47 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ZMINP__genmod
          INTERFACE 
            SUBROUTINE ZMINP(LINE,MA,LA,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              CHARACTER(LEN=1), INTENT(IN) :: LINE(LB)
              INTEGER(KIND=4), INTENT(INOUT) :: MA(2)
              INTEGER(KIND=4), INTENT(IN) :: LA
            END SUBROUTINE ZMINP
          END INTERFACE 
        END MODULE ZMINP__genmod
