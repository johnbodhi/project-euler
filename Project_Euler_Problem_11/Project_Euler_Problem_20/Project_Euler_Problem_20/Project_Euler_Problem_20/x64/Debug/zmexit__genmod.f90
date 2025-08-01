        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:34:55 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ZMEXIT__genmod
          INTERFACE 
            SUBROUTINE ZMEXIT(MT,MC,NDSAVE,MXSAVE,KASAVE,KOVUN)
              INTEGER(KIND=4), INTENT(IN) :: MT(2)
              INTEGER(KIND=4), INTENT(INOUT) :: MC(2)
              INTEGER(KIND=4), INTENT(INOUT) :: NDSAVE
              REAL(KIND=8), INTENT(INOUT) :: MXSAVE
              INTEGER(KIND=4), INTENT(INOUT) :: KASAVE
              INTEGER(KIND=4), INTENT(INOUT) :: KOVUN
            END SUBROUTINE ZMEXIT
          END INTERFACE 
        END MODULE ZMEXIT__genmod
