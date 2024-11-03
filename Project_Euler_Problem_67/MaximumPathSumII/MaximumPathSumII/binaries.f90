program MaximumPathSumII
use ifport
implicit none

real                                 :: t,t_(2),t1,t2


integer, parameter                   :: N = 5, M = N

integer, parameter                   :: LL = N - 2

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

real,    dimension(N-1)              :: B, Z

real,    dimension(N-1,M-1)          :: Q, A, AS

real,    dimension(N-1,M-1,N-1)      :: R, RA, RS

real,    dimension(2)                :: SS


call CPU_TIME(t1); t = etime(t_);

    

do i = 2,N         
    do j = 2,M       
        if( j .eq. 2 .or. i .eq. j ) then
            
            Q(i-1,j-1) = 1;  
            
        elseif( i .ge. j ) then
            
            Q(i-1,j-1) = Q(i-2,j-2) + Q(i-2,j-1);      
            
        else
            
            Q(i-1,j-1) = 0;            
            
        endif        
    enddo     
enddo
Z(:) = Q(N-1,1:M-1);

ii = 1;
do i = LL,1,-1
    
    B(ii) = -i; ii = ii + 1;    
enddo

do i = 1,LL

    B(i) = 2**B(i);
enddo

qq = 0; pp = 0; rr = 1;

do rr = 1,LL

    S = rr + 0.5;
    
    do i = 1,LL
        
        V(i) = floor(S * B(i));
        
        V(i) = ( V(i) - floor( V(i) / 2.0 ) * 2.0 ) + 1.0;
        
        if( V(i) .le. 1 ) then
            
            V(i) = 0;
            
        elseif ( V(i) .gt. 1 ) then
            
            V(i) = 1;
            
        endif
            
    enddo
    
    print*, V
    
    pause
    
enddo













print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)

write(*,*) 'Program has used', t2,'seconds.'

pause

end program MaximumPathSumII