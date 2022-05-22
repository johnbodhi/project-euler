program Project_Euler_Problem_13
use ifport 
implicit none

integer :: i
real*8  :: j, k = 0
real    :: t,t_(2),elapsed_time,t1,t2

call CPU_TIME(t1); t = etime(t_)

t = etime(t_)

open(1,file = 'numbers.txt',status = 'old',action = 'read')

do i = 1,100
    read(1,*) j
    k = k + j
enddo

print"('',F70.2)",k

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause

end program Project_Euler_Problem_13