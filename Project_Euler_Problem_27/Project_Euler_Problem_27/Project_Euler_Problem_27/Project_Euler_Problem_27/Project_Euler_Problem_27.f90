program Project_Euler_Problem_27
implicit none

real :: j,k,i = 0,u = 1,v = 1
logical :: q = .true.
integer, dimension(1) :: t
real, dimension(:), allocatable :: E,F,L,M,R
logical, dimension(:), allocatable :: P

allocate(E(1000))
allocate(F(1000))
allocate(L(1000000))
allocate(M(1000000))
allocate(P(1000))
allocate(R(1000000))

do j = -999,999
    do k = -1000,1000
        do while (q == .true. .and. E(u) .ge. 0)
            E(u) = i ** 2 + j * i + k
            F(u) = j * k
            call primality(E(u),q)
            P(u) = q  
            !print*,int(i),int(j),int(k),int(E(u)),P(u),int(F(u))
            i = i + 1; u = u + 1
        enddo   
        L(v) = maxval(F); 
        M(v) = minval(F); 
        R(v) = count(P == .true.)
        !print*,int(M(v)),int(L(v)),int(R(v))
        q = .true.; v = v + 1; E = 0; F = 0; P = 0; i = 0; u = 1
    enddo   
enddo

print "('Maximum prime span: ',I8 )",int(maxval(R))
t = maxloc(R)
print "('Maximum product of coefficients A and B: ', I10)",int(L(t))
print "('Minimum product of coefficients A and B: ', I10)",int(M(t))
pause

end program Project_Euler_Problem_27

subroutine primality(p,q)
    implicit none
    real :: i,p
    logical, intent(out) :: q
    real*8, dimension(:),allocatable :: A
    allocate(A(int(p)))
    
    do i = 1,p
        A(i) = mod(p,i)
    enddo
    
    if(count(A == 0.0) == 2.0)then
        q = .true.
    else
        q = .false.
    endif    
    A = 0       
end subroutine