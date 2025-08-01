        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:34:49 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FPCOMP__genmod
          INTERFACE 
            FUNCTION FPCOMP(MA,LREL,MB)
              INTEGER(KIND=4), INTENT(IN) :: MA
              CHARACTER(*), INTENT(IN) :: LREL
              INTEGER(KIND=4), INTENT(IN) :: MB
              LOGICAL(KIND=4) :: FPCOMP
            END FUNCTION FPCOMP
          END INTERFACE 
        END MODULE FPCOMP__genmod
