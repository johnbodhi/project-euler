program Project_Euler_Problem_16
use fmzm
use ifport
implicit none
    
type(im)                               :: res
integer                                :: lenr,i,j,k = 0,M,R,S
character(:), allocatable              :: str
character(1024)                        :: fmat
!integer                                :: N = 2**10
!integer, dimension(:), allocatable     :: D
real                                   :: t,t_(2),elapsed_time
    
t = etime(t_)

open(1,file = "2_1000.txt",status = 'old',action = 'readwrite',recl = 1)

res  = to_im(2)**1000
lenr = log10( to_fm( res ) ) + 1

allocate(character(lenr) :: str)
write(fmat,*) "i", lenr
call im_form(fmat, res, str)

write(*,*) trim( adjustl( str ) )

do i = 1,lenr
    read(1,*) j
    k = k + j
end do

print*," "
print*,'The sum of the digits of 2**1000 is: ',k

!M = floor( log10( real( N ) ) + 1 ) 
!allocate(D(M))

!R = N
!do i = 1,M
!    D(i) = R - ( R / 10 ) * 10 
!    R = R / 10
!end do

!S = sum(D)
!print*,'The sum of the digits is: ', S

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)
pause
end program