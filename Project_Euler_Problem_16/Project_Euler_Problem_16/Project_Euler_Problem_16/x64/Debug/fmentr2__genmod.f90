        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:54 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMENTR2__genmod
          INTERFACE 
            SUBROUTINE FMENTR2(NROUTN,MA,MB,NARGS,KNAM,MC,KRESLT,NDSAVE,&
     &MXSAVE,KASAVE,KOVUN)
              CHARACTER(LEN=9), INTENT(IN) :: NROUTN
              INTEGER(KIND=4), INTENT(IN) :: MA
              INTEGER(KIND=4), INTENT(IN) :: MB
              INTEGER(KIND=4), INTENT(IN) :: NARGS
              INTEGER(KIND=4), INTENT(IN) :: KNAM
              INTEGER(KIND=4), INTENT(INOUT) :: MC
              INTEGER(KIND=4), INTENT(INOUT) :: KRESLT
              INTEGER(KIND=4), INTENT(INOUT) :: NDSAVE
              REAL(KIND=8), INTENT(INOUT) :: MXSAVE
              INTEGER(KIND=4), INTENT(INOUT) :: KASAVE
              INTEGER(KIND=4), INTENT(INOUT) :: KOVUN
            END SUBROUTINE FMENTR2
          END INTERFACE 
        END MODULE FMENTR2__genmod
