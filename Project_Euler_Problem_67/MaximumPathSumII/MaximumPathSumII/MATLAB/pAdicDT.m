function [F_] = pAdicDT(N_,F_,B_,RA_,RAF_,RS_,RSF_)

    S_(1) = 0; S_(2) = 0;
    S_(3) = 0; S_(4) = 0;

    for i = 1:1:size(B_,1)   

        k = sum(B_(i,:))+1;

        ii = 1; jj = 1;

        for j = 1:1:N_
        
            if ( ~B_(i,j)    )
            
                S_(1) = S_(1) + RA_ (ii,jj,k);
                S_(3) = S_(3) + RAF_(ii,jj,k);  
                
                S_(2) = S_(2) + RS_ (ii,jj,k);
                S_(4) = S_(4) + RSF_(ii,jj,k);
                
                jj = jj + 1;
            
            elseif ( B_(i,j) )
            
                S_(1) = S_(1) + RA_ (ii,jj,k);
                S_(3) = S_(3) + RAF_(ii,jj,k);
                
                S_(2) = S_(2) + RS_ (ii,jj,k);
                S_(4) = S_(4) + RSF_(ii,jj,k);
                
                jj = jj + 1;
                ii = ii + 1;
            
            end            
        end
        [F_] = sol(S_,F_);
        
        S_(1) = 0; S_(2) = 0;
        S_(3) = 0; S_(4) = 0;   
    end
    