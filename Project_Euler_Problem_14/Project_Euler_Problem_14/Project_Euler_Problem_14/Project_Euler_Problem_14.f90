program Project_Euler_Problem_14
use ifport
implicit none

integer,parameter       :: L = 1e6
integer*8               :: M = 1e6-1,N = 1e6-1,O = 1e6-1
integer                 :: i = 1,j = 1
integer, dimension(700) :: collatz_chain
integer, dimension(L)   :: collatz_chain_sizes,collatz_starting_values
integer, dimension(1)   :: k
real                    :: t,t_(2),elapsed_time,t1,t2

call CPU_TIME(t1); t = etime(t_)



do j = 1,M,1    
    collatz_starting_values(j) = O   
    do while ( N .gt. 1 )    
        if( mod(N,2) == 0 ) then
            collatz_chain(i) = N / 2 
            N = N / 2
        else
            collatz_chain(i) = 3 * N + 1
            N = 3 * N + 1   
        endif
        i = i + 1
    enddo    
    collatz_chain_sizes(j) = count( collatz_chain /= 0 )
    collatz_chain = 0
    O = O - 1
    N = O
    i = 1    
enddo

k = maxloc(collatz_chain_sizes)
print*,'Max Starting Value: ',collatz_starting_values(k),'Steps: ',collatz_chain_sizes(k)

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause
end program Project_Euler_Problem_14