        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:35:20 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMBESJ2__genmod
          INTERFACE 
            SUBROUTINE FMBESJ2(N1,N2,X,ARRAY)
              INTEGER(KIND=4), INTENT(IN) :: N2
              INTEGER(KIND=4), INTENT(IN) :: N1
              INTEGER(KIND=4), INTENT(IN) :: X
              INTEGER(KIND=4), INTENT(INOUT) :: ARRAY(ABS(N2-N1)+1)
            END SUBROUTINE FMBESJ2
          END INTERFACE 
        END MODULE FMBESJ2__genmod
