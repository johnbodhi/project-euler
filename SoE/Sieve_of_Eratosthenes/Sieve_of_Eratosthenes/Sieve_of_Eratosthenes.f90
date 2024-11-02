program Sieve_of_Eratosthenes
use ifport
implicit none

integer, parameter                 :: iMax = 1000000
integer                            :: i
logical, dimension(:), allocatable :: isPrime
real                               :: t,t_(2),elapsed_time,t1,t2

allocate(isPrime(iMax))

call CPU_TIME(t1); t = etime(t_)
 
open(10,file = 'primes.txt',action = 'write')

isPrime    = .true.
isPrime(1) = .false.
    
do i = 2,int( sqrt( real ( iMax ) ) )
    if( isPrime(i) ) isPrime( i * i : iMax : i ) = .false.
end do
    
do i = 1,iMax
    if( isPrime(i) ) write(10,*) i
end do

print*," "
write(*,*) 'Program has used',t,'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause
end program Sieve_of_Eratosthenes