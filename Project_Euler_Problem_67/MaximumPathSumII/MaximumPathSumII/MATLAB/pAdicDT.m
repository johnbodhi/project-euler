function [F_] = pAdicDT(F_,B_,R_)

    [S_] = resetAcc(R_); N = size(R_,1);

    for i = 1:1:size(B_,1)

        l = sum(B_(i,:))+1; 

        for k = 1:1:size(R_,3)

            ii = 1; jj = 1;

            for j = 1:1:N  
    
                if  ( ~B_(i,j)   )  
                                                        
                    S_(1) = S_(1) + R_(ii,jj,k,l);
                    S_(1) = S_(1) + R_(ii,jj,k,l);
    
                    S_(2) = S_(2) + R_(ii,jj,k,l);
                    S_(2) = S_(2) + R_(ii,jj,k,l);
                 
                    jj    = jj + 1;   
    
                elseif ( B_(i,j) )   
    
                    S_(1) = S_(1) + R_(ii,jj,k,l);
                    S_(1) = S_(1) + R_(ii,jj,k,l);

                    S_(2) = S_(2) + R_(ii,jj,k,l);
                    S_(2) = S_(2) + R_(ii,jj,k,l);
 
                    jj    = jj + 1;
                    ii    = ii + 1;  
    
                end    
            end
            [F_] = sol(S_,F_); [S_] = resetAcc(R_); 

        end   
    end