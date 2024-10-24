program binaryDirectives
use ifport
implicit none


integer                              :: i, j, k

integer                              :: ii

real                                 :: qq, pp, kk

integer, parameter                   :: N = 21, M = 21, L = 16

real                                 :: S

integer, dimension(:), allocatable   :: D

real, dimension(:), allocatable      :: B, Z

real, dimension(:,:), allocatable    :: A

real                                 :: t,t_(2),t1,t2


allocate(B(L))

allocate(A(N,M))

allocate(D(L))

allocate(Z(N-1))


call CPU_TIME(t1); t = etime(t_);

open(10, file = "triangle_large.csv", status = "old", action = "read" )

A = 0; B = 0; D = 0; Z = 0;

do i = 2,N           
    do j = 2,M        
        if( j .eq. 2 .or. i .eq. j ) then
            
            A(i-1,j-1) = 1;  
            
        elseif( i .ge. j ) then
            
            A(i-1,j-1) = A(i-2,j-2) + A(i-2,j-1);      
            
        else
            
            A(i-1,j-1) = 0;            
            
        endif        
    enddo     
enddo
Z(:) = A(N-1,1:M-1); 

print*, Z

ii = 1;
do i = L-1,1,-1
    
    B(ii) = -i; ii = ii + 1;
enddo

do i = 1,L

    B(i) = 2**B(i);
enddo

qq = 0; pp = 0; kk = 1;

do i = 1,N-1

    do while( pp < Z(i) )
    
        S = kk + 0.5;
    
        do i = 1,L
        
            D(i) = floor(S * B(i));
        
            D(i) = ( D(i) - floor( D(i) / 2.0 ) * 2.0 ) + 1.0;
        
            if( D(i) .le. 1 ) then
            
                D(i) = 0;
            
            elseif ( D(i) .gt. 1 ) then
            
                D(i) = 1;
            
            endif
            
        enddo
        
        if ( sum(D(:)) .eq. qq ) then
            
            pp = pp + 1;
            
            ! The entire decision tree goes here...
            
            
            
            
            
        endif  
        kk = kk + 1;
    
    enddo
    qq = qq + 1; pp = 0; kk = 1;
enddo

close(10);

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)
call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'

pause

end program binaryDirectives