program MaximumPathSumII
use ifport
implicit none

real                                 :: t,t_(2),t1,t2


integer, parameter                   :: N = 5, M = N

real                                 :: NN = N-1, MM = M-1


integer                              :: i, j, k

integer                              :: ii, jj, kk

integer                              :: cc, dd, hh

integer                              :: INF, SUP

real                                 :: p, pp, qq, rr


integer                              :: L

real                                 :: H, S


real,    dimension((N-1)*(M-1))      :: RF

integer, dimension(N-1)              :: V



integer, dimension(N-1,M-1,N-1)      :: D

real,    dimension(N-1)              :: B, Z, SS

real,    dimension(N-1,M-1)          :: Q, A, AS

real,    dimension(N-1,M-1,N-1)      :: R, RA, RS


call CPU_TIME(t1); t = etime(t_);


! Open and allocate our files to memory.

open(10, file = 'triangle_tiny.txt' , status = 'old', access = 'sequential', action = 'read' );
!open(20, file = 'triangle_small.txt', status = 'old', access = 'sequential', action = 'read' );
!open(30, file = 'triangle_large.txt', status = 'old', access = 'sequential', action = 'read' );

! Open a practice / verification file to write into.

open(20, file = 'write.txt', status = 'old', access = 'sequential', action = 'readwrite' );

! Read the vectors into an array.

read(10,*) RF
!read(20,*) RF
!read(30,*) RF


! Transform the vector into a matrix.

ii = 1;
do j = 1,M-1,1
    do i = 1,N-1,1

        A(i,j) = RF(ii); 
        
        ii = ii + 1;        
    enddo 
enddo 

! Column-wise symmetric flip...

AS = A; jj = 1;

do i = N-1,1,-1
    
    if ( i .gt. 2 ) then
    
        do j = i,floor(NN/2)+1,-1
            
            L = AS(i,j);
            
            AS(i,j) = AS(i,jj);
            
            AS(i,jj) = L; jj = jj + 1;
            
        enddo
        jj = 1;
    
    else 
        
        do j = i,floor(NN/2),-1
            
            L = AS(i,j);
            
            AS(i,j) = AS(i,jj);
            
            AS(i,jj) = L; jj = jj + 1;
            
        enddo
        
        jj = 1;        
    endif
    
enddo

! Transpose matrix A to march through natrually.

A(:,:)  = transpose(A(:,:));

AS(:,:) = transpose(AS(:,:));

! Generate 3-D storage of all branch subspaces within decision constraint. 

do k = N-1,1,-1
    do j = 1,M-1
        do i = 1,N-1       
            
            if( k .eq. N-1 ) then
                cc = 0;
                do jj = 1,M-1
                    do ii = 1,N-1
                        
                        if( ii .eq. jj ) then
                            D(k-cc,jj,k ) = k-cc;
                            cc = cc + 1;
                        endif
                        
                    enddo
                enddo

            elseif( k .lt. M-1 .or. k .gt. 1 ) then

                hh = M - 1 - k + 1; 
                dd = 1;
                
                do p = k,1,-1
                    
                    D(p,dd:hh,k) = p;
                    dd = dd + 1;
                    hh = hh + 1; 
                enddo             

            elseif( k .eq. 1 ) then
                    
                do jj = 1,M-1
                    do ii = 1,N-1
                        
                        if( ii .eq. N-1 ) then
                            
                            D(N-1,j,k) = k;
                        endif
                        
                    enddo
                enddo
                
            endif
            
        enddo
    enddo
enddo

! Re-assign all true values in matrix A associated with the Trellis 
! indexes to matrix R.

! Row-wise asymmetric flip...

do k = 1,N-1
    jj = 1;
    do i = N-1,1,-1
        do j = N-1,floor(NN/2)+1,-1
            
            L = D(i,j,k);
            
            D(i,j,k) = D(i,jj,k);
            
            D(i,jj,k) = L; jj = jj + 1;
            
        enddo
        jj = 1;
    enddo
enddo

do k = 1,N-1
    do j = 1,M-1
        do i = 1,N-1
            
            if( D(i,j,k) .gt. 0 ) then

                RA(i,j,k) = A(D(i,j,k),j);

                RS(i,j,k) = AS(D(i,j,k),j);
                
            endif 
            
        enddo
    enddo
enddo

! We want to march through the first half of the tree, and it's
! reflection to minimize the search for eigenvectors that define the 
! paths through the dyadic tree.

if( mod(NN,2.0) .ne. 0.0 ) then
    
    R(:,:,1:floor(NN/2)+1)  = RA(:,:,1:floor(NN/2)+1);
    R(:,:,floor(NN/2)+2:NN) = RS(:,:,1:floor(NN/2));
    
    kk  = floor(NN/2) + 2;
    
    SUP = (NN - floor(floor(NN/2) / 2 )) / 2;
    
    INF = floor(NN/2) + SUP;
      
else

    R(:,:,1:floor(NN/2))    = RA(:,:,1:floor(NN/2));
    R(:,:,floor(NN/2)+1:NN) = RS(:,:,1:floor(NN/2));
    
    kk = floor(O/2) + 1;
    
    SUP = floor((NN - floor(floor(NN/2) / 2 )) / 2);
    
    INF = floor(NN/2) + SUP;
      
endif

do k = N-1:-1:INF    
    do j = M-1:-1:1
        do i = N-1:-1:1
    
            L = R(i,j,k);

            R(i,j,k) = R(i,j,kk);

            R(i,j,kk) = L; 
            
        enddo
    enddo
    kk = kk + 1;    
enddo

!do k = 1,N-1
!    
!    jj = 1;
!    do i = N-1,1,-1
!        do j = N-1,floor(NN/2)+1,-1
!        
!            L = D(i,j,k);
!        
!            D(i,j,k) = D(i,jj,k);
!        
!            D(i,jj,k) = L; jj = jj + 1;
!        
!        enddo
!        jj = 1;
!        
!    enddo
!enddo
!
!do k = 1,N-1
!    
!    jj = 1;
!    do i = N-1,1,-1
!        do j = N-1,floor(NN/2)+1,-1
!        
!            L = R(i,j,k);
!        
!            R(i,j,k) = R(i,jj,k);
!        
!            R(i,jj,k) = L; jj = jj + 1;
!        
!        enddo
!        jj = 1;
!        
!    enddo
!enddo

! Downward circular shift...
 
!do k = 1,N-1
!    do j = 1,M-1    
!        
!        L = R(N-1,j,k)
!        
!        do i = 1,N-1
!            
!            if ( i .lt. N-1 ) then
!        
!                R(N-1-i+1,j,k) = R(N-1-i,j,k);
!            
!            elseif ( i .eq. N-1 ) then
!                
!               R(N-1-i+1,j,k) = L;
!            
!            endif
!        
!        enddo        
!    enddo    
!enddo
!
!pause

! Pascal...

!do i = 2,N         
!    do j = 2,M       
!        if( j .eq. 2 .or. i .eq. j ) then
!            
!            Q(i-1,j-1) = 1;  
!            
!        elseif( i .ge. j ) then
!            
!            Q(i-1,j-1) = Q(i-2,j-2) + Q(i-2,j-1);      
!            
!        else
!            
!            Q(i-1,j-1) = 0;            
!            
!        endif        
!    enddo     
!enddo
!Z(:) = Q(N-1,1:M-1);
!
!pause

!ii = 1;
!do i = L-1,1,-1
!    
!
!    B(ii) = -i; ii = ii + 1;
!enddo
!
!do i = 1,L
!
!    B(i) = 2**B(i);
!enddo
!
!
!do k = 1,N-1
!       
!       jj = 1;
!       do i = N-1,1,-1
!           do j = N-1,floor(NN/2)+1,-1
!           
!               L = R(i,j,k);
!           
!               R(i,j,k) = R(i,jj,k);
!           
!               R(i,jj,k) = L; jj = jj + 1;
!           
!           enddo
!           jj = 1;
!           
!       enddo
!   enddo
!
!qq = 0; pp = 0; rr = 1;
!
!do j = 1,N-1
!
!    do while( rr < Z(j) )
!    
!        S = rr + 0.5;
!    
!        do i = 1,L-1
!        
!            V(i) = floor(S * B(i));
!        
!            V(i) = ( V(i) - floor( V(i) / 2.0 ) * 2.0 ) + 1.0;
!        
!            if( V(i) .le. 1 ) then
!            
!                V(i) = 0;
!            
!            elseif ( V(i) .gt. 1 ) then
!            
!                V(i) = 1;
!            
!            endif
!            
!        enddo
!        
!        if ( sum(V(:)) .eq. qq ) then
!            
!            pp = pp + 1;
!            
!            ! We need to put the entire tree algorithm before the storage of astronomical numbers...
!            
!            do kk = 1,N
!        
!                ii = 2; jj = 1; ! Top-to-bottom...
!    
!                S = R(ii,jj,kk);
!
!                do k = 1,Z(kk)
!                    
!                    do p = 1,N
!    
!                        if( V(i) .eq. 0 ) then
!        
!                            if( jj .le. N - 1 ) then
!        
!                                jj = jj + 1; 
!                    
!                                S = S + R(ii,jj,kk);  
!                    
!                            endif          
!           
!                        elseif( V(i) .eq. 1 ) then
!        
!                            if( ii .gt. N - M + 1 .and. jj .le. N - 1 ) then
!                        
!                                ii = ii + 1;
!                    
!                                jj = jj + 1;    
!                    
!                                S = S + R(ii,jj,kk); 
!                   
!                            endif
!                            
!                        endif
!            
!                    enddo
!
!                    SS(1) = S;
!    
!                    if( SS(1) < SS(2) ) then
!    
!                        SS(1) = SS(2);
!                        SS(2) = 0;
!
!                    elseif( SS(1) > SS(2) ) then
!    
!                        SS(2) =  0; 
!                        
!                    endif     
!                    
!                enddo
!                ii = 2; jj = 1; 
!                
!                S = R(ii,jj,kk);            
!                
!            enddo
!
!        endif
!        rr = rr + 1;
!    
!    enddo
!    
!    qq = qq + 1; pp = 0; rr = 1;
!enddo
!H = maxval(SS(:));
!
!print*, H

close(10);
close(20);
close(30);
close(40);

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)

write(*,*) 'Program has used', t2,'seconds.'

pause

end program MaximumPathSumII