        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:50 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ZPOUT__genmod
          INTERFACE 
            SUBROUTINE ZPOUT(MA,LINE,LB,LAST1,LAST2)
              INTEGER(KIND=4), INTENT(IN) :: LB
              INTEGER(KIND=4), INTENT(IN) :: MA(2)
              CHARACTER(LEN=1), INTENT(INOUT) :: LINE(LB)
              INTEGER(KIND=4), INTENT(INOUT) :: LAST1
              INTEGER(KIND=4), INTENT(INOUT) :: LAST2
            END SUBROUTINE ZPOUT
          END INTERFACE 
        END MODULE ZPOUT__genmod
