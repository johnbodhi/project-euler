        !COMPILER-GENERATED INTERFACE MODULE: Mon Aug  9 10:11:33 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE IPCOMP__genmod
          INTERFACE 
            FUNCTION IPCOMP(MA,LREL,MB)
              INTEGER(KIND=4), INTENT(IN) :: MA
              CHARACTER(*), INTENT(IN) :: LREL
              INTEGER(KIND=4), INTENT(IN) :: MB
              LOGICAL(KIND=4) :: IPCOMP
            END FUNCTION IPCOMP
          END INTERFACE 
        END MODULE IPCOMP__genmod
