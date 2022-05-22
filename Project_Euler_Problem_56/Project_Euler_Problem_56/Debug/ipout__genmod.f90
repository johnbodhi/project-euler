        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 11:15:54 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IPOUT__genmod
          INTERFACE 
            SUBROUTINE IPOUT(MA,LINE,LB)
              INTEGER(KIND=4), INTENT(IN) :: LB
              INTEGER(KIND=4), INTENT(IN) :: MA
              CHARACTER(LEN=1), INTENT(INOUT) :: LINE(LB)
            END SUBROUTINE IPOUT
          END INTERFACE 
        END MODULE IPOUT__genmod
