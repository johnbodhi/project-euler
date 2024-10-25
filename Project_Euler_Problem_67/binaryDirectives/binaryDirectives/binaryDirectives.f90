program binaryDirectives
use ifport
use fmzm
implicit none

real                                 :: t,t_(2),t1,t2


integer                              :: i, j, k, ii, jj, kk

integer                              :: ii_, jj_, kk_

real                                 :: p, q, r, pp, qq, rr


integer, parameter                   :: N = 101, M = 101, L = 20


real                                 :: S

integer, dimension(:), allocatable   :: E

real, dimension(:), allocatable      :: B, Z, SS

real, dimension(:,:), allocatable    :: Q, A, AS

real, dimension(:,:,:), allocatable  :: C, D, R, RA, RF, RS, V


allocate(B(L))

allocate(E(L))

allocate(Z(N-1))

allocate(SS(2))


allocate(Q(N,M))

allocate(A(N,M))

allocate(AS(N,M))


allocate(C(N,M,N))

allocate(D(N,M,N))

allocate(R(N,M,N))

allocate(RA(N,M,N))

allocate(RS(N,M,N))

allocate(V(N,M,N))


call CPU_TIME(t1); t = etime(t_);

!open(10, file = "triangle_large.csv", status = "old", action = "read" )
!
!do i = 1,N,1
!    do j = 1,M,1
!    
!        read*, Q(i,j)        
!    enddo
!enddo


Q = 0; B = 0; D = 0; Z = 0;

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

! print*, Z(1:N/2)

ii = 1;
do i = L-1,1,-1
    
    B(ii) = -i; ii = ii + 1;
enddo

do i = 1,L

    B(i) = 2**B(i);
enddo

qq = 0; pp = 0; kk = 1;

do j = 1,N-1

    do while( pp < Z(j) )
    
        S = kk + 0.5;
    
        do i = 1,L-1
        
            E(i) = floor(S * B(i));
        
            E(i) = ( E(i) - floor( E(i) / 2.0 ) * 2.0 ) + 1.0;
        
            if( E(i) .le. 1 ) then
            
                E(i) = 0;
            
            elseif ( E(i) .gt. 1 ) then
            
                E(i) = 1;
            
            endif
            
        enddo
        
        if ( sum(E(:)) .eq. qq ) then
            
            pp = pp + 1;
            
            ! V_(:,pp,i) = B;
            
            ! We need to put the entire tree algorithm before the storage of astronomical numbers...
            
            
            
        endif  
        kk = kk + 1;
    
    enddo
    
    qq = qq + 1; pp = 0; kk = 1;
enddo

for i = 1:1:size(A,1)

    AS(i,1:i) = flip(A(i,1:i),2);
end

! Transpose matrix A to march through natrually.

A  = transpose(A);

AS = transpose(AS);

! Generate 3-D storage of all branch subspaces within decision constraint. 

for k = size( D, 3 ):-1:1
    for j = 1:1:size( D, 2 )
        for i = 1:1:size( D, 1 )               
            
            if( k == size(D,3) )
                cc = 0;
                for j = 1:size(D,2)
                    for i = 1:size(D,1)
                        if( i == j )
                            D( k - cc, j, k ) = k - cc;
                            cc = cc + 1;
                        end
                    end
                end

            elseif( k < size(D,2) || k > 1 )

                hh = size(D,2) - k + 1; 
                dd = 1;
                for p = k:-1:1
                    D( p, dd:hh, k ) = p;
                    dd = dd + 1;
                    hh = hh + 1; 
                end                

            elseif( k == 1 )
                    
                for j = 1:size(D,2)
                    for i = 1:size(D,1)
                        if( i == size(D,1) )
                            D( size(D,1), j, k ) = k;
                        end
                    end
                end
                
            end
        end
    end
end

! Re-assign all true values in matrix A associated with the Trellis 
! indexes to matrix R.

D = flip(D,2);
for k = 1:size(D,3)
    for j = 1:size(D,2)
        for i = 1:size(D,1)
            if( D( i, j, k ) )

                RA( i, j, k ) = A( D( i, j, k ), j );

                RS( i, j, k ) = AS( D( i, j, k ), j );
            end            
        end
    end
end

! We want to march through the first half of the tree, and it's
! reflection to minimize the search for eigenvectors that define the 
! paths through the dyadic tree.

if( mod(N,2) ~= 0 )

    R = cat(3,RA(:,:,1:floor(N/2)+1),RS(:,:,1:floor(N/2)));

    R(:,:,floor(N/2)+2:N) = flip(R(:,:,floor(N/2)+2:N),3);
else

    R = cat(3,RA(:,:,1:floor(N/2)),RS(:,:,1:floor(N/2)));

    R(:,:,floor(N/2)+1:N) = flip(R(:,:,floor(N/2)+1:N),3);
end
D = flip(D,2); R = flip(R,2);

R = circshift(R,1,1);


! This routine will march through every directive given by the binary
! streams, and add all corresponding elements in the tree.

SS = zeros(1,2);

RF = flip(R,2);

do kk = 1,N
        
    R = RF; ii_ = 2;
        
    ii = ii_; jj = 1; ! Top-to-bottom...
    
    S = R(ii,jj,kk);

    do j = 1,Z(kk)
        
        do i = 1,N
    
            if( ~V(i,j,kk) )
        
                if( jj .le. N - 1 )
        
                    jj = jj + 1; 
                    
                    S = S + R(ii,jj,kk);  
                    
                end           
           
            elseif( V(i,j,kk) )
        
                if( ii .gt. N - M + 1 .and. jj .le. N - 1 )
                        
                    ii = ii + 1;
                    
                    jj = jj + 1;    
                    
                    S = S + R(ii,jj,kk); 
                   
                end                
            end
        end

        SS(1) = S;
    
        if( SS(1) < SS(2) )
    
            SS(1) =  SS(2);
            SS(2) =  0;

        elseif( SS(1) > SS(2) )
    
            SS(2) =  0; 
        end
        ii = ii_; jj = 1; 
        
        S = R(ii,jj,kk);
    end

end
H = max(SS);









































close(10);

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)
call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'

pause

end program binaryDirectives