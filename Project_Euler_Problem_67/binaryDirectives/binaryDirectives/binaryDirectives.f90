program binaryDirectives
use ifport
implicit none


real :: t,t_(2),t1,t2

call CPU_TIME(t1); t = etime(t_);


!!! Find all legal paths through the Trellis.
!
!Z = diag( flip( pascal( size( A, 1 ) ), 2 ) ); % Number of paths through the triangle from each bottom index.
!
!! We need to find all binary combinations below M-1. These are the all the
!! paths specified by the opposite diagonal of Pascal's matrix.
!
!qq = 0; pp = 0; kk = 1;
!for i = 1:1:N
!
!    while( pp < Z(i,1) )
!
!        B = permn([0 1],M-1,kk);
!
!        if( sum( B, 2 ) == qq )
!    
!            pp = pp + 1;
!
!            V_(:,pp,i) = B;
!        end
!        kk = kk + 1;
!    end
!    qq = qq + 1; pp = 0; kk = 1;
!end


print*," "
write(*,*) 'Program has used',t, 'seconds of CPU time.'
write(*,*) 'User Time: ',t_(1),' System Time: ',t_(2)
call CPU_TIME(t2)
write(*,*) 'Program has used', t2,'seconds.'

pause

end program binaryDirectives