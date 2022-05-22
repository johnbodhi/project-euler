        !COMPILER-GENERATED INTERFACE MODULE: Mon Aug  9 10:11:25 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMINP3__genmod
          INTERFACE 
            SUBROUTINE FMINP3(LINE,KSTART,KSTOP,MA)
              INTEGER(KIND=4), INTENT(IN) :: KSTOP
              CHARACTER(LEN=1), INTENT(IN) :: LINE(KSTOP)
              INTEGER(KIND=4), INTENT(IN) :: KSTART
              INTEGER(KIND=4), INTENT(INOUT) :: MA
            END SUBROUTINE FMINP3
          END INTERFACE 
        END MODULE FMINP3__genmod
