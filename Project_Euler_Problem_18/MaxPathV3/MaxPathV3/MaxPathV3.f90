program MaxPathV3
    use ifport
    implicit none

    integer, parameter      :: X = 15, N = X, M = X
    integer                 :: i, j, ii, jj, kk, xx, uu, S = 0
    integer, dimension(N,M) :: A, C1, C2
    integer, dimension(N)   :: V
    integer, dimension(2)   :: B
    real                    :: t,t_(2),t1,t2,ta(2)

    call CPU_TIME(t1); t = etime(t_)

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
            read(1,*) C1(i,j) 
        enddo    
        ! Populate initial state...
        V(j) = 1;
    enddo
    
    ! Transpose...
    do i = 1,N,1
        do j = 1,M,1
            C2(i,j) = C1(j,i);
        enddo
    enddo
    
    ! Flip...
    do i = 1,N,1
        do j = 1,M,1            
            A(i,M-j+1) = C2(i,j);
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
    jj = 1; uu = 1; xx = 0; ii = 0;
    do while( uu .le. kk )
        
        ii = ii + 1;
        
        V(ii) = V(ii) + 1; 
        
        do j = 1,M,1    
            S = S + A(V(j),j);  
        enddo
        
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
        
        uu = uu + 1; 
        S = 0;  
        
        if( jj .ge. M ) exit
    enddo
    
    ! Print maximum path...    
    print*, B(1)
        
    print*," "
    write(*,*) 'Program has used',t, 'seconds of CPU time.'
    write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

    call CPU_TIME(t2)
    write(*,*) 'Program has used', t2,'seconds.'
    pause

end program MaxPathV3