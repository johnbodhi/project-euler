function [F_] = pAdicDT(N_,F_,B_,L_)

    [S_] = resetAcc(L_);

    for i = 1:1:size(B_,1)

        k = sum(B_(i,:))+1;

        ii = 1; jj = 1;

        for j = 1:1:N_
        
            if ( ~B_(i,j)    )

                for l = 2:2:size(S_,1)

                    S_(l-1) = S_(l-1) + L_(ii,jj,k,l-1);
                    S_(l)   = S_(l)   + L_(ii,jj,k,l)  ;
                end
                
                jj = jj + 1;
            
            elseif ( B_(i,j) )
           
                for l = 2:2:size(L_,4)

                    S_(l-1) = S_(l-1) + L_(ii,jj,k,l-1);
                    S_(l)   = S_(l)   + L_(ii,jj,k,l)  ;
                end
                
                jj = jj + 1;
                ii = ii + 1;
            
            end            
        end
        [F_] = sol(S_,F_); [S_] = resetAcc(L_);
        
    end