        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:52 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMEXT2__genmod
          INTERFACE 
            SUBROUTINE FMEXT2(MT,MC,NDSAVE,MXSAVE,KASAVE,KOVUN)
              INTEGER(KIND=4), INTENT(IN) :: MT
              INTEGER(KIND=4), INTENT(INOUT) :: MC
              INTEGER(KIND=4), INTENT(INOUT) :: NDSAVE
              REAL(KIND=8), INTENT(INOUT) :: MXSAVE
              INTEGER(KIND=4), INTENT(INOUT) :: KASAVE
              INTEGER(KIND=4), INTENT(INOUT) :: KOVUN
            END SUBROUTINE FMEXT2
          END INTERFACE 
        END MODULE FMEXT2__genmod
