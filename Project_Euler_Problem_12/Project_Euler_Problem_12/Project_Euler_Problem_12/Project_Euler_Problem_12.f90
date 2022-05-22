program Project_Euler_Problem_12
implicit none

integer                          :: i,j = 1,k = 0,number_divisors = 0,number_anti_divisors = 0
integer,parameter                :: N = 25000
integer,dimension(:),allocatable :: triangle_numbers,natural_numbers
real                             :: t,t_(2),elapsed_time,t1,t2

call CPU_TIME(t1); t = etime(t_)

allocate( triangle_numbers(N) )
allocate( natural_numbers(N)  )

do i = 1,N
    natural_numbers(i) = i
    triangle_numbers(i) = sum(natural_numbers(:i))
enddo

print 20
20 format('Factors',T10,'Triangle Number',T20)
print*
  
do i = 1,N
    k = 0
    do j = 1,triangle_numbers(i)
        if(mod(triangle_numbers(i),j) == 0)then
            k = k + 1
        endif 
    enddo    
    if(k .ge. 500) then
        print 10,k,triangle_numbers(i)
    10  format (I3,T10,I15,T30)
    endif    
enddo

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause
end program Project_Euler_Problem_12

