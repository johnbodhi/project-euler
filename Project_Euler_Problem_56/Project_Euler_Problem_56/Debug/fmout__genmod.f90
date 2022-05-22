        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 11:15:53 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMOUT__genmod
          INTERFACE 
            SUBROUTINE FMOUT(MA,LINE,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              INTEGER(KIND=4), INTENT(IN) :: MA
              CHARACTER(LEN=1), INTENT(INOUT) :: LINE(LB)
            END SUBROUTINE FMOUT
          END INTERFACE 
        END MODULE FMOUT__genmod
