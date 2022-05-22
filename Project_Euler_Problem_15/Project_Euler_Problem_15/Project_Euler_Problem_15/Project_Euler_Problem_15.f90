program Project_Euler_Problem_15
use ifport
implicit none

real*8 :: i,n,k,f_n = 1,f_k = 1,f_nk = 1,m = 0,nCk,U = 0
real   :: t,t_(2),elapsed_time,t1,t2

call CPU_TIME(t1); t = etime(t_)

! nCr should yield number of unique paths trough the lattice. Let's write an algorithm for n choose k...

! Since the formula for the binomial coefficient is n! / k! * (n - k)! we need a factorial subroutine.

! n choose k (number of ways to choose k objects out of n without regard to order).

! For any N x N lattice, one must transverse N times vertially and N times horizontally to reach node (N,N) from node (0,0).

print*, 'Please input number of vertical paths plus number of horizontal paths (n), and N choices (k) :'
read*, n,k

do i = n,1,-1
    f_n = f_n * ( n - m )
    m = m + 1    
enddo

m = 0

do i = k,1,-1
    f_k = f_k * ( k - m )
    m = m + 1    
enddo

m = 0

do i = (n-k),1,-1
    f_nk = f_nk * ( ( n - k ) - m )
    m = m + 1    
enddo

nCk = f_n / (f_k * f_nk)

print*, 'nCk = ', nCk

if (nCk > 1000000) then
    U = U + 1
end if

print*, U

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause
end program Project_Euler_Problem_15