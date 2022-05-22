program Project_Euler_Problem_56
use fmzm
use ifport
implicit none

type(im)                               :: res
integer                                :: i,j,k,lenr
integer, dimension(1)                  :: maxvalue
integer, dimension(100)                :: sums
integer, dimension(200)                :: U

character(200)                         :: stringin
character(1)                           :: X
integer                                :: single_character,V,S
integer, dimension(200)                :: stringArray

character(:),allocatable               :: str
character(1024)                        :: fmat
real                                   :: t,t_(2),elapsed_time,t1,t2

call CPU_TIME(t1); t = etime(t_)

do i = 1,99
    do j = 1,99 
    
        open(10,file = "powerfulDigitSum.txt",status = 'old',action = 'readwrite',recl = 200)        
        res = to_im(i)**j; lenr = log10( to_fm( res ) ) + 1;        
        allocate( character( lenr ) :: str )     
        write(fmat,*) "i", lenr     
        call im_form(fmat, res, str)     
        write(10,*) trim( adjustl( str ) )    
        stringin = str

        do k = 1, len(stringin)    
            single_character = iachar(stringin(k:k))    
            X                = achar(single_character)    
            write(10,*) X    
            read(X,'(I1)') V    
            stringArray(k) = V    
        end do

        sums(j) = sum(stringArray)    
        stringArray = 0    
        deallocate(str)
        close(10)    
    end do
end do

maxvalue = maxval(sums)

print*," "
print*, 'The maximum digital sum is ', maxvalue(1)

print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)

call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'
pause
end program Project_Euler_Problem_56