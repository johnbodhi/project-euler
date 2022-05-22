        !COMPILER-GENERATED INTERFACE MODULE: Mon Aug  9 10:11:21 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMFFT_INIT__genmod
          INTERFACE 
            SUBROUTINE FMFFT_INIT(ROOTS_OF_UNITY,N)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: ROOTS_OF_UNITY(0:N-1)
            END SUBROUTINE FMFFT_INIT
          END INTERFACE 
        END MODULE FMFFT_INIT__genmod
