program Project_Euler_Problem_53
use ifport
implicit none

real*8                    :: i,n,k,m = 0,f_n = 1,f_k = 1,f_nk = 1,nCk,U = 0
real                       :: t,t_(2),elapsed_time,t1,t2

call CPU_TIME(t1); t = etime(t_)

do n = 1,100
    do k = 1,100
        
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
        
        if ( nCk > 1000000) then
            U = U + 1
        end if
        
        m = 0; f_n = 1; f_k = 1; f_nk = 1;    
    end do
end do

print*, U

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause
end program Project_Euler_Problem_53

