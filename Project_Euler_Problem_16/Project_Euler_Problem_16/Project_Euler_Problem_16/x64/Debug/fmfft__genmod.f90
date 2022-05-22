        !COMPILER-GENERATED INTERFACE MODULE: Sun Aug  8 12:26:43 2021
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FMFFT__genmod
          INTERFACE 
            SUBROUTINE FMFFT(A,N,ROOTS_OF_UNITY,A2)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: A(N)
              COMPLEX(KIND=8) :: ROOTS_OF_UNITY(0:N-1)
              COMPLEX(KIND=8) :: A2(N)
            END SUBROUTINE FMFFT
          END INTERFACE 
        END MODULE FMFFT__genmod
