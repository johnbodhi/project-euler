        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:42 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IMGCD_REDUCE_UV__genmod
          INTERFACE 
            SUBROUTINE IMGCD_REDUCE_UV(U,V,V_SHIFT,A1,B1,C1,D1)
              INTEGER(KIND=4), INTENT(INOUT) :: U
              INTEGER(KIND=4), INTENT(INOUT) :: V
              INTEGER(KIND=4) :: V_SHIFT
              REAL(KIND=8), INTENT(IN) :: A1
              REAL(KIND=8), INTENT(IN) :: B1
              REAL(KIND=8), INTENT(IN) :: C1
              REAL(KIND=8), INTENT(IN) :: D1
            END SUBROUTINE IMGCD_REDUCE_UV
          END INTERFACE 
        END MODULE IMGCD_REDUCE_UV__genmod
