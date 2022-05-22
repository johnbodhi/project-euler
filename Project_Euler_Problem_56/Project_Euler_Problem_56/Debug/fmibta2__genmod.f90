        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 11:16:26 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMIBTA2__genmod
          INTERFACE 
            SUBROUTINE FMIBTA2(K_RETURN_CODE,MXY,MXSAVE,NTERMS,NUMTRY,  &
     &NMETHD)
              INTEGER(KIND=4), INTENT(INOUT) :: K_RETURN_CODE
              INTEGER(KIND=4), INTENT(INOUT) :: MXY(37)
              REAL(KIND=8), INTENT(INOUT) :: MXSAVE
              INTEGER(KIND=4), INTENT(INOUT) :: NTERMS
              INTEGER(KIND=4), INTENT(INOUT) :: NUMTRY
              INTEGER(KIND=4), INTENT(INOUT) :: NMETHD
            END SUBROUTINE FMIBTA2
          END INTERFACE 
        END MODULE FMIBTA2__genmod
