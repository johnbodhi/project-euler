        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:27:26 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMBESY2__genmod
          INTERFACE 
            SUBROUTINE FMBESY2(N1,N2,X,ARRAY)
              INTEGER(KIND=4), INTENT(IN) :: N2
              INTEGER(KIND=4), INTENT(IN) :: N1
              INTEGER(KIND=4), INTENT(IN) :: X
              INTEGER(KIND=4), INTENT(INOUT) :: ARRAY(ABS(N2-N1)+1)
            END SUBROUTINE FMBESY2
          END INTERFACE 
        END MODULE FMBESY2__genmod
