        !COMPILER-GENERATED INTERFACE MODULE: Sat Aug  7 15:34:45 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMCHANGEBASE_TQ__genmod
          INTERFACE 
            RECURSIVE SUBROUTINE FMCHANGEBASE_TQ(MA,MBSAVE,A,B,MT,MQ,   &
     &MBPOWERS)
              INTEGER(KIND=4), INTENT(IN) :: MA
              REAL(KIND=8), INTENT(IN) :: MBSAVE
              INTEGER(KIND=4), INTENT(IN) :: A
              INTEGER(KIND=4), INTENT(IN) :: B
              INTEGER(KIND=4), INTENT(INOUT) :: MT
              INTEGER(KIND=4), INTENT(INOUT) :: MQ
              INTEGER(KIND=4) :: MBPOWERS(9)
            END SUBROUTINE FMCHANGEBASE_TQ
          END INTERFACE 
        END MODULE FMCHANGEBASE_TQ__genmod
