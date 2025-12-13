function [F_] = pAdicSpace(A_,B_,G_,F_)

    % We need to reparameterize exponential space into an optimum
    % sub-space distribution of Lagrangians to use in tandem with 
    % the field of directives in p-adic space.

    % This will enable further efficiency by reducing the search space to
    % fewer and lesser convolutional binary groups, especially when the 
    % search space is large.

    % From here, we are able to span forward and back ward linear sweeps 
    % across all observations almost simultaneously.

    M = size(B_,2); [S_] = resetAcc(M_); 

    for i = 1:1:size(B_,1)
    
        Q = sum(A_(i,:))+1; 
    
        ii = 1; jj = 1;

        for k = 1:1:size(G_,3)
    
            for j = 1:1:M
        
                if  ( ~B_(i,j) )                     
                                                        
                    S_(1) = S_(1) + GA_(ii,jj,k,Q);
                    S_(1) = S_(1) + GA_(ii,jj,k,Q);
    
                    S_(2) = S_(2) + GB_(ii,jj,k,Q);
                    S_(2) = S_(2) + GB_(ii,jj,k,Q);
    
                    S_(3) = S_(3) + GC_(ii,jj,k,Q);
                    S_(3) = S_(3) + GC_(ii,jj,k,Q);
    
                    S_(4) = S_(4) + GD_(ii,jj,k,Q);
                    S_(4) = S_(4) + GD_(ii,jj,k,Q);
    
                    S_(5) = S_(5) + GE_(ii,jj,k,Q);
                    S_(5) = S_(5) + GE_(ii,jj,k,Q);
    
                    S_(6) = S_(6) + GF_(ii,jj,k,Q);
                    S_(6) = S_(6) + GF_(ii,jj,k,Q);
    
                    S_(7) = S_(7) + GG_(ii,jj,k,Q);
                    S_(7) = S_(7) + GG_(ii,jj,k,Q);
    
                    S_(8) = S_(8) + GH_(ii,jj,k,Q);
                    S_(8) = S_(8) + GH_(ii,jj,k,Q);
                 
                    jj    = jj + 1;   
        
                elseif ( B_(i,j) )   
        
                    S_(1) = S_(1) + GA_(ii,jj,k,Q);
                    S_(1) = S_(1) + GA_(ii,jj,k,Q);
    
                    S_(2) = S_(2) + GB_(ii,jj,k,Q);
                    S_(2) = S_(2) + GB_(ii,jj,k,Q);
    
                    S_(3) = S_(3) + GC_(ii,jj,k,Q);
                    S_(3) = S_(3) + GC_(ii,jj,k,Q);
    
                    S_(4) = S_(4) + GD_(ii,jj,k,Q);
                    S_(4) = S_(4) + GD_(ii,jj,k,Q);
    
                    S_(5) = S_(5) + GE_(ii,jj,k,Q);
                    S_(5) = S_(5) + GE_(ii,jj,k,Q);
    
                    S_(6) = S_(6) + GF_(ii,jj,k,Q);
                    S_(6) = S_(6) + GF_(ii,jj,k,Q);
    
                    S_(7) = S_(7) + GG_(ii,jj,k,Q);
                    S_(7) = S_(7) + GG_(ii,jj,k,Q);
    
                    S_(8) = S_(8) + GH_(ii,jj,k,Q);
                    S_(8) = S_(8) + GH_(ii,jj,k,Q);
        
                    jj    = jj + 1;
                    ii    = ii + 1;  
        
                end
            end
            
        end
        [F_] = sol(S_,F_); [S_] = resetAcc(G_); 
    
    end