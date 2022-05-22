        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:49 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FPOUT__genmod
          INTERFACE 
            SUBROUTINE FPOUT(MA,LINE,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              INTEGER(KIND=4), INTENT(IN) :: MA
              CHARACTER(LEN=1), INTENT(INOUT) :: LINE(LB)
            END SUBROUTINE FPOUT
          END INTERFACE 
        END MODULE FPOUT__genmod
