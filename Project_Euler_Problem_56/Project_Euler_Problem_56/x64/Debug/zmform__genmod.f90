        !COMPILER-GENERATED INTERFACE MODULE: Mon Aug  9 10:11:56 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE ZMFORM__genmod
          INTERFACE 
            SUBROUTINE ZMFORM(FORM1,FORM2,MA,STRING)
              CHARACTER(*), INTENT(IN) :: FORM1
              CHARACTER(*), INTENT(IN) :: FORM2
              INTEGER(KIND=4), INTENT(IN) :: MA(2)
              CHARACTER(*), INTENT(INOUT) :: STRING
            END SUBROUTINE ZMFORM
          END INTERFACE 
        END MODULE ZMFORM__genmod
