        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:54 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMEXIT__genmod
          INTERFACE 
            SUBROUTINE FMEXIT(MT,MC,NDSAVE,MXSAVE,KASAVE,KOVUN)
              INTEGER(KIND=4), INTENT(IN) :: MT
              INTEGER(KIND=4), INTENT(INOUT) :: MC
              INTEGER(KIND=4), INTENT(IN) :: NDSAVE
              REAL(KIND=8), INTENT(IN) :: MXSAVE
              INTEGER(KIND=4), INTENT(IN) :: KASAVE
              INTEGER(KIND=4), INTENT(IN) :: KOVUN
            END SUBROUTINE FMEXIT
          END INTERFACE 
        END MODULE FMEXIT__genmod
