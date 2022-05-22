program Project_Euler_Problem_11
use ifport
implicit none

integer                                              :: i,j,k = 1,l = 1,o = 1,p = 1,N,M,adjacency,Z
parameter(N = 20,M = 20,adjacency = 4)
real                                                 :: w,ta(2)
integer, dimension(N,M)                              :: A
integer, dimension(((N-adjacency+1)**4) * adjacency) :: B
integer, dimension((N-adjacency+1)*N)                :: C,D,E,F
integer, dimension(4)                                :: G
real                                                 :: t,t_(2),elapsed_time,t1,t2

call CPU_TIME(t1); t = etime(t_)

w = etime(ta)

open(1,file = "array.txt")
read(1,*) ((A(i,j), j = 1,M), i = 1,N)

!do i = 1,N
!    print*,int(A(i,:))
!enddo

do i = 1,N
    do j = 1,M-adjacency+1
    C(k) = A(i,j) * A(i,j+1) * A(i,j+2) * A(i,j+3)
    k = k + 1
    enddo
enddo

do j = 1,M
    do i = 1,N-adjacency+1
        D(l) = A(i,j) * A(i+1,j) * A(i+2,j) * A(i+3,j)
        l = l + 1
    enddo
enddo

do i = 1,N-adjacency+1
    do j = 1,M-adjacency+1
        E(o) = A(i,j) * A(i+1,j+1) * A(i+2,j+2) * A(i+3,j+3)
        o = o + 1
    enddo
enddo

do i = 1,N-adjacency+1
    do j = 1,M-adjacency+1
        F(p) = A(i,j+3) * A(i+1,j+2) * A(i+2,j+1) * A(i+3,j)
        p = p + 1
    enddo
enddo

print 10
10 format('N',T15,'C(i)',T25,'D(i)',T35,'E(i)',T45,'F(i)',T55)
print*

do i = 1,size(C)
    print 20,i,C(i),D(i),E(i),F(i)
    20 format(I3,T10,I10,T20,I10,T30,I10,T40,I10,T50)
enddo

G(1) = maxval(C); G(2) = maxval(D); G(3) = maxval(E); G(4) = maxval(F)

Z = maxval(G); print*, Z


print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause

end program Project_Euler_Problem_11

