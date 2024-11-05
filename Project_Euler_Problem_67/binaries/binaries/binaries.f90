program MaximumPathSumII
use ifport
implicit none

real                                 :: t,t_(2),t1,t2


integer, parameter                   :: N = 31, M = N

integer, parameter                   :: LL = N-2

real                                 :: NN = N-1


integer                              :: i, j, k

integer                              :: ii

real                                 :: pp, qq, rr


real                                 :: S


integer, dimension(LL)               :: V


real,    dimension(LL)               :: B

real,    dimension(N-1)              :: Z

real,    dimension(N-1,M-1)          :: Q



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

do j = 1,ceiling(NN/2.0)

    do while( pp < Z(j) )
    
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
        
        if ( sum(V) .eq. qq ) then
            
            pp = pp + 1;

        endif
        rr = rr + 2;
        
    enddo
    qq = qq + 1; pp = 0; rr = 2;
    
enddo

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)

write(*,*) 'Program has used', t2,'seconds.'

pause

end program MaximumPathSumII