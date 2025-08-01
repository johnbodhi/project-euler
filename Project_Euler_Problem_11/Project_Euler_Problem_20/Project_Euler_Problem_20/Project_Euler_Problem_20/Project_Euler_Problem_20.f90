program Project_Euler_Problem_20
use fmzm
use ifport
implicit none

type(im)                 :: res
integer                  :: i,j,k = 0,lenr,N = 100
character(:),allocatable :: str
character(1024)          :: fmat
real                     :: t,t_(2),elapsed_time
!integer*8, dimension(:), allocatable   :: D
!integer*8                              :: N = 10,M,i,R,S,f_n = 1,j = 0



t = etime(t_)

open(1,file = "100_factorial.txt",status = 'old',action = 'readwrite',recl = 1)

res = factorial(N); 
lenr = log10( to_fm( res ) ) + 1;

allocate(character(lenr) :: str); write(fmat, "(A5,I0)") "i", lenr; call im_form(fmat, res, str)

write(*,*) trim( adjustl( str ) )     

do i = 1,lenr
    read(1,*) j
    k = k + j
enddo

print*," "; print*,"The sum of the digits in 100! is ",k

! Cannot run this code for numbers larger than 2**64-1...

!do i = N,1,-1
!    f_n = f_n * ( N - j )
!    j = j + 1    
!enddo
!
!N = f_n
!
!M = floor( log10( real( N ) ) + 1 ) ! Number of digits.
!allocate(D(M))
!
!R = N
!do i = 1,M
!    D(i) = R - ( R / 10 ) * 10 
!    R = R / 10
!end do
!
!S = sum(D)
!print*,'The sum of the digits is: ', S

print*," " 
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)
pause

end program Project_Euler_Problem_20

