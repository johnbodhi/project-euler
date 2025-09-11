function [F_] = pAdicDT(F_,B_,R_)

    [S_] = resetAcc(R_);
    
    N = size(R_,1); M = size(S_,2);

    for i = 1:1:size(B_,1)

        k = sum(B_(i,:))+1; ii = 1; jj = 1;

        for j = 1:1:N  
            if ( ~B_(i,j)   )   
                for l = M:-1:1
                                                    
                    S_(l)   = S_(l)   + RT_ (ii,jj,k,l);
                    S_(l-1) = S_(l-1) + RB_ (ii,jj,k,l);
                    S_(l-2) = S_(l-2) + RTS_(ii,jj,k,l);
                    S_(l-3) = S_(l-3) + RBS_(ii,jj,k,l);
                end             
                jj = jj + 1;                            
            elseif ( B_(i,j) )                             
                for l = M:-1:1

                    S_(l)   = S_(l)   + RT_ (ii,jj,k,l);
                    S_(l-1) = S_(l-1) + RB_ (ii,jj,k,l);
                    S_(l-2) = S_(l-2) + RTS_(ii,jj,k,l);
                    S_(l-3) = S_(l-3) + RBS_(ii,jj,k,l);
                end    
                jj = jj + 1;
                ii = ii + 1;              
            end     
        end
        [F_] = sol(S_,F_); [S_] = resetAcc(R_); 
    end