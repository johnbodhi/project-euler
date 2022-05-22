        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:34:46 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMINP2__genmod
          INTERFACE 
            SUBROUTINE FMINP2(MXY,LINE,KSTART,KSTOP,KPOWER)
              INTEGER(KIND=4), INTENT(IN) :: KSTOP
              INTEGER(KIND=4), INTENT(INOUT) :: MXY(5)
              CHARACTER(LEN=1), INTENT(IN) :: LINE(KSTOP)
              INTEGER(KIND=4), INTENT(IN) :: KSTART
              INTEGER(KIND=4), INTENT(IN) :: KPOWER
            END SUBROUTINE FMINP2
          END INTERFACE 
        END MODULE FMINP2__genmod
