        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:57 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ZMENTR__genmod
          INTERFACE 
            SUBROUTINE ZMENTR(NROUTN,MA,MB,NARGS,MC,KRESLT,NDSAVE,MXSAVE&
     &,KASAVE,KOVUN)
              CHARACTER(LEN=9) :: NROUTN
              INTEGER(KIND=4), INTENT(IN) :: MA(2)
              INTEGER(KIND=4), INTENT(IN) :: MB(2)
              INTEGER(KIND=4) :: NARGS
              INTEGER(KIND=4), INTENT(INOUT) :: MC(2)
              INTEGER(KIND=4) :: KRESLT
              INTEGER(KIND=4) :: NDSAVE
              REAL(KIND=8) :: MXSAVE
              INTEGER(KIND=4) :: KASAVE
              INTEGER(KIND=4) :: KOVUN
            END SUBROUTINE ZMENTR
          END INTERFACE 
        END MODULE ZMENTR__genmod
