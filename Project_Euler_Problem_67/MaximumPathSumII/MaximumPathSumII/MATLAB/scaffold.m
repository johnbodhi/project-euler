function [D_] = scaffold(A_)

    N_ = size(A_,1)    ; % save("N_.mat","N_");

    N_ = load("N_.mat"); N_ = N_.N_           ;

    D = zeros(N_,N_,N_)                       ;
    for k = N_:-1:1
        for j = 1:1:N_
            for i = 1:1:N_           
                if(k == N_)
                    cc = 0;
                    for jj = 1:1:N_
                        for ii = 1:1:N_
                            if( ii == jj )
                                D( k - cc, jj, k ) = k - cc;
                                cc = cc + 1;
                            end
                        end
                    end
                elseif( k < N_ || k > 1 )
                    hh = N_ - k + 1; 
                    dd = 1;
                    for p = k:-1:1
                        D( p, dd:hh, k ) = p;
                        dd = dd + 1;
                        hh = hh + 1;
                    end              
                elseif( k == 1 )
                    for j = 1:1:N_
                        for i = 1:1:N_
                            if( i == N_ )
                                D( N_, j, k ) = k;
                            end
                        end
                    end
                end
            end
        end
    end
    D_ = flip(D,2)                   ;

    % save("D_.mat","D_")            ;
    % D_ = load("D_.mat"); D_ = D_.D_;