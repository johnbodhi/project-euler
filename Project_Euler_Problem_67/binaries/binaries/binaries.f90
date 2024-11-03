program MaximumPathSumII
use ifport
implicit none

real                                 :: t,t_(2),t1,t2


integer, parameter                   :: N = 6, M = N

integer, parameter                   :: LL = N-2

real                                 :: NN = N-1, MM = M-1


integer                              :: i, j, k

integer                              :: ii, jj, kk

integer                              :: cc, dd, hh

integer                              :: INF, SUP

real                                 :: p, pp, qq, rr


integer                              :: L, LN, L1

integer                              :: H

real                                 :: S


real,    dimension((N-1)*(M-1))      :: RF

integer, dimension(LL)               :: V



integer, dimension(N-1,M-1,N-1)      :: D

real,    dimension(LL)               :: B

real,    dimension(N-1)              :: Z

real,    dimension(N-1,M-1)          :: Q, A, AS

real,    dimension(N-1,M-1,N-1)      :: R, RA, RS

real,    dimension(2)                :: SS


call CPU_TIME(t1); t = etime(t_);

ii = 1;
do i = LL,1,-1
    
    B(ii) = -i; ii = ii + 1;    
enddo

do i = 1,LL

    B(i) = 2**B(i);
enddo

do rr = 1,32,2

    S = rr + 0.50;
    
    do i = 1,LL
        
        V(i) = floor(S * B(i));
        
        V(i) = ( V(i) - floor( V(i) / 2.0 ) * 2.0 ) + 1.0;
        
        if( V(i) .le. 1 ) then
            
            V(i) = 0;
            
        elseif ( V(i) .gt. 1 ) then
            
            V(i) = 1;
            
        endif
            
    enddo
    
enddo



print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)

write(*,*) 'Program has used', t2,'seconds.'

pause

end program MaximumPathSumII