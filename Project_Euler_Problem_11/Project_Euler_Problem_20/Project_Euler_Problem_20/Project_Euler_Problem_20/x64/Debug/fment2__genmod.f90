        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:35:06 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMENT2__genmod
          INTERFACE 
            SUBROUTINE FMENT2(NROUTN,MA,MB,NARGS,KNAM,MC,KRESLT,NDSAVE, &
     &MXSAVE,KASAVE,KOVUN)
              CHARACTER(LEN=9) :: NROUTN
              INTEGER(KIND=4), INTENT(IN) :: MA
              INTEGER(KIND=4), INTENT(IN) :: MB
              INTEGER(KIND=4) :: NARGS
              INTEGER(KIND=4) :: KNAM
              INTEGER(KIND=4), INTENT(INOUT) :: MC
              INTEGER(KIND=4) :: KRESLT
              INTEGER(KIND=4) :: NDSAVE
              REAL(KIND=8) :: MXSAVE
              INTEGER(KIND=4) :: KASAVE
              INTEGER(KIND=4) :: KOVUN
            END SUBROUTINE FMENT2
          END INTERFACE 
        END MODULE FMENT2__genmod
