        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:49 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IMOUT__genmod
          INTERFACE 
            SUBROUTINE IMOUT(MA,LINE,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              INTEGER(KIND=4), INTENT(IN) :: MA
              CHARACTER(LEN=1), INTENT(INOUT) :: LINE(LB)
            END SUBROUTINE IMOUT
          END INTERFACE 
        END MODULE IMOUT__genmod
