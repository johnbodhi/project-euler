        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:35:12 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ZPFORM__genmod
          INTERFACE 
            SUBROUTINE ZPFORM(FORM1,FORM2,MA,STRING)
              CHARACTER(*), INTENT(IN) :: FORM1
              CHARACTER(*), INTENT(IN) :: FORM2
              INTEGER(KIND=4), INTENT(IN) :: MA(2)
              CHARACTER(*), INTENT(INOUT) :: STRING
            END SUBROUTINE ZPFORM
          END INTERFACE 
        END MODULE ZPFORM__genmod
