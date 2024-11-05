function [ B_ ] = genFun( U_ )

    global N

    if( U_ == 1 )
    
            K_(1,1) = 1;

            B_ = permn([0;1],N-1,K_);

    elseif( U_ == 2 )

        for i = 1:1:N
        
            K_(i,1) = 0.5*(2^i+2);
        end
        B_ = permn([0;1],N-1,K_);

    elseif( U_ > 2 )
        
        % B_ = permn([0;1],N-1,K_);

        qq = 0; pp = 0; jj = 1; kk = 1;
        for i = 1:1:ceil(N/2)
            while( pp < Z(i,1) )
        
                B = permn([0;1],M-1,kk);
        
                if( sum(B,2) > qq )
            
                    pp = pp + 1;
        
                    % V_(:,pp,i)     = B;            
                    % V_(1:M-1,pp,i) = B;
                    % V_(M,pp,i)     = kk;
                    % V_(i,pp)         = kk;

                    if( ~V_(:,jj-1,sum(B,2)) )
        
                        V_(:,jj-1,sum(B,2)) = B;

                    elseif( V_(:,jj-1,sum(B,2)) )
                        
                        V_(:,jj,sum(B,2)) = B;

                        jj = jj + 1;
                    end
        
                end
                kk = kk + 1;
                
            end
            qq = qq + 1; pp = 0; kk = 1;
        end

    end




end