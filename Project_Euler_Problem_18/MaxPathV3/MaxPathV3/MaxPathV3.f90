program MaxPathV3
    use ifport
    implicit none

    integer, parameter      :: X = 15, N = X, M = X
    integer                 :: i, j
    integer                 :: ii, jj, kk, xx, uu
    integer                 :: S = 0
    integer, dimension(N,M) :: A, R, T
    integer, dimension(N)   :: V
    integer, dimension(2)   :: B
    !real                    :: t,t_(2),t1,t2,ta(2)

    !call CPU_TIME(t1); t = etime(t_);

    !open( unit = 1, file = 'triangle_very_small.txt', action = 'read', blank = 'zero', status = 'old')
    open( unit = 1, file = 'triangle_small.txt', action = 'read', blank = 'zero', status = 'old')
    !open( unit = 1, file = 'triangle_large.txt', action = 'read', blank = 'zero', status = 'old')
    
    ! Pre-allocate solution array...
    do i = 1,2,1
        B(i) = 0;    
    enddo   
    
    ! Read in lower triangular matrix...
    do j = 1,M,1
        do i = 1,N,1    
            read(1,*) R(i,j) 
        enddo    
        ! Populate initial state...
        V(j) = 1;
    enddo
    
    ! Transpose...
    do i = 1,N,1
        do j = 1,M,1
            T(i,j) = R(j,i);
        enddo
    enddo
    
    ! Flip...
    do i = 1,N,1
        do j = 1,M,1            
            A(i,M-j+1) = T(i,j);
        enddo
    enddo    
    
    ! Accumulate while limit...
    kk = 0;
    do j = 1,M-1,1
        do i = 1,N-j,1        
            kk = kk + 1;        
        enddo
    enddo
    kk = kk*(X-1);
 
    ! Find the rest of the sums...
    
    ! Alpha...
    
    jj = 1; uu = 1; xx = 1; ii = 0;
    do while( uu .le. kk )
        
        do j = 1,M,1    
            S = S + A(V(j),j);  
            !print*, V(j)
        enddo   
        !pause
        
        B(2) = S;
        
        if( B(2) .gt. B(1) ) then
        
            B(1) = S; B(2) = 0;        
        else  
            
            B(2) = 0;        
        endif              
        
        if( ii .eq. N-jj ) then            
            if( jj .eq. N-1 ) then
                
                xx = xx + 1;                   
                do j = 1,M,1
                
                    V(j) = 1;
                enddo                 
                
                ii = 0;
                jj = xx;            
            else
            
                ii = 0;
                jj = jj + 1;            
            end if           
        endif   
        
        if( jj .ge. M ) exit
        
        ii = ii + 1;
            
        V(ii) = V(ii) + 1;
        
        uu = uu + 1; S = 0;
    enddo
    
    !print*, uu
    
    ! Print maximum path...    
    print*, B(1)
        
    !print*," "
    !write(*,*) 'Program has used', t, 'seconds of CPU time.'
    !write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)
    !
    !call CPU_TIME(t2)
    !write(*,*) 'Program has used', t2,'seconds.'
    pause

end program MaxPathV3