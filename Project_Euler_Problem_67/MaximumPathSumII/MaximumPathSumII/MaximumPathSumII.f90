program MaximumPathSumII
use ifport
implicit none

real                                 :: t,t_(2),t1,t2


integer                              :: i, j, k

integer                              :: ii, jj, kk

integer                              :: cc, dd, hh

real                                 :: p, pp, qq, rr


integer                              :: N, M

real                                 :: NN, MM


real                                 :: H, S

integer                              :: L

integer, dimension(:), allocatable   :: V

real, dimension(:), allocatable      :: B, Z, SS

real, dimension(:,:), allocatable    :: Q, A, AS

real, dimension(:,:,:), allocatable  :: D, R, RA, RS


allocate(B(L))

allocate(V(L))

allocate(Z(N-1))


allocate(SS(2))


allocate(Q(N,M))

allocate(A(N,M))

allocate(AS(N,M))


allocate(D(N,M,N))


allocate(R(2*N,M,N))

allocate(RA(N,M,N))

allocate(RS(N,M,N))


call CPU_TIME(t1); t = etime(t_);


open(10, file = "triangle_small.txt", status = "old", action = "read" )
! open(20, file = "triangle_large.csv", status = "old", action = "read" )

do i = 1,N,1
    do j = 1,M,1
    
        read*, A(i,j)
        
        print*, A(i,j)
        
    enddo
enddo

N = size(A(:,:),1); NN = N; 

M = size(A(:,:),2); MM = M;

! Transpose matrix A to march through natrually.

A(:,:)  = transpose(A(:,:));

AS(:,:) = transpose(AS(:,:));

! Generate 3-D storage of all branch subspaces within decision constraint. 

do k = N,1,-1
    do j = 1,M
        do i = 1,N         
            
            if( k .eq. N ) then
                cc = 0;
                do jj = 1,M
                    do ii = 1,N
                        
                        if( ii .eq. jj ) then
                            D(k-cc,j,k ) = k-cc;
                            cc = cc + 1;
                        endif
                        
                    enddo
                enddo

            elseif( k .lt. M .or. k .gt. 1 ) then

                hh = M - k + 1; 
                dd = 1;
                
                do p = k,1,-1
                    
                    D(p,dd:hh,k) = p;
                    dd = dd + 1;
                    hh = hh + 1; 
                enddo             

            elseif( k .eq. 1 ) then
                    
                do jj = 1,M
                    do ii = 1,N
                        
                        if( ii .eq. N ) then
                            
                            D(N,j,k) = k;
                        endif
                        
                    enddo
                enddo
                
            endif
            
        enddo
    enddo
enddo

! Re-assign all true values in matrix A associated with the Trellis 
! indexes to matrix R.

do k = 1,N
    do i = 1,N
        do j = 1,M
        
            L = D(i,N-j+1,k)

            D(i,N-j+1,k) = D(i,j,k);
        
            D(i,j,k) = L;
        
        enddo
    enddo
enddo


do k = 1,N
    do j = 1,M
        do i = 1,N
            
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

if( mod(N,2) ) then
    
    do i = 1,N
        do j = 1,M
            do k = 1,floor(NN/2)+1
                
                R(i,j,k) = RA(i,j,k);
                    
            enddo
        enddo
    enddo
    
    do i = 1,N
        do j = 1,M
            do k = 1,floor(NN/2)
                
                R(i,j,k+floor(NN/2)+1) = RS(i,j,k);
                    
            enddo
        enddo
    enddo
    
    do i = 1,N
        do j = 1,M
            do k = floor(NN/2)+2,N
                    
                L = R(i,j,N-k+1);

                R(i,j,N-k+1) = R(i,j,k);
        
                R(i,j,k) = L;
                
            enddo        
        enddo
    enddo    
    
else

    do i = 1,N
        do j = 1,M
            do k = 1,floor(NN/2)
                
                R(i,j,k) = RA(i,j,k);
                 
            enddo
        enddo
    enddo
    
    do i = 1,N
        do j = 1,M
            do k = 1,floor(NN/2)
                
                R(i,j,k+floor(NN/2)+1) = RS(i,j,k);
                    
            enddo
        enddo
    enddo
    
    do i = 1,N
        do j = 1,M
            do k = floor(NN/2)+1,N
               
                L = R(i,j,N-k+1);

                R(i,j,N-k+1) = R(i,j,k);
        
                R(i,j,k) = L;
                    
            enddo        
        enddo
    enddo       
    
endif
    
do k = 1,N
    do i = 1,N
        do j = 1,M
        
            L = D(i,j,N-k+1);

            D(i,j,N-k+1) = D(i,j,k);
        
            D(i,j,k) = L;
            
        enddo
    enddo
enddo

do k = 1,N
    do i = 1,N
        do j = 1,M
        
            L = R(i,j,N-k+1);

            R(i,j,N-k+1) = R(i,j,k);
        
            R(i,j,k) = L;
        
        enddo
    enddo
enddo

do i = 1,N-1
    do j = 1,M
        
        if ( i .le. 1 ) then
       
            K = A(N-i+1,j);
        
            A(N-i+1,j) = A(i,j);
            
        elseif ( i .gt. 1 ) then
        
            K = A(i+1,j);
            
            A(i+1,j) = A(i,j);
            
            A(i,j) = K;            
            
        endif
        
    enddo
enddo

! Pascal...

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
do i = L-1,1,-1
    
    B(ii) = -i; ii = ii + 1;
enddo

do i = 1,L

    B(i) = 2**B(i);
enddo

! March forward through the Trellises per binary directive....

do k = 1,N
    do i = 1,N
        do j = 1,M
        
            L = R(i,j,N-k+1);

            R(i,j,N-k+1) = R(i,j,k);
        
            R(i,j,k) = L;
        
        enddo
    enddo
enddo

qq = 0; pp = 0; rr = 1;

do j = 1,N-1

    do while( rr < Z(j) )
    
        S = rr + 0.5;
    
        do i = 1,L-1
        
            V(i) = floor(S * B(i));
        
            V(i) = ( V(i) - floor( V(i) / 2.0 ) * 2.0 ) + 1.0;
        
            if( V(i) .le. 1 ) then
            
                V(i) = 0;
            
            elseif ( V(i) .gt. 1 ) then
            
                V(i) = 1;
            
            endif
            
        enddo
        
        if ( sum(V(:)) .eq. qq ) then
            
            pp = pp + 1;
            
            ! We need to put the entire tree algorithm before the storage of astronomical numbers...
            
            do kk = 1,N
        
                ii = 2; jj = 1; ! Top-to-bottom...
    
                S = R(ii,jj,kk);

                do k = 1,Z(kk)
                    
                    do p = 1,N
    
                        if( .not. V(i) ) then
        
                            if( jj .le. N - 1 ) then
        
                                jj = jj + 1; 
                    
                                S = S + R(ii,jj,kk);  
                    
                            endif          
           
                        elseif( V(i) ) then
        
                            if( ii .gt. N - M + 1 .and. jj .le. N - 1 ) then
                        
                                ii = ii + 1;
                    
                                jj = jj + 1;    
                    
                                S = S + R(ii,jj,kk); 
                   
                            endif
                            
                        endif
            
                    enddo

                    SS(1) = S;
    
                    if( SS(1) < SS(2) ) then
    
                        SS(1) =  SS(2);
                        SS(2) =  0;

                    elseif( SS(1) > SS(2) ) then
    
                        SS(2) =  0; 
                        
                    endif     
                    
                enddo
                ii = 2; jj = 1; 
                
                S = R(ii,jj,kk);            
                
            enddo

        endif
        rr = rr + 1;
    
    enddo
    
    qq = qq + 1; pp = 0; rr = 1;
enddo
H = maxval(SS(:));

print*, H

close(10);
close(20);

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)

write(*,*) 'Program has used', t2,'seconds.'

pause

end program MaximumPathSumII