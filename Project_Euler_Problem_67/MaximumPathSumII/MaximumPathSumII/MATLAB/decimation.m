function [ NEXPSPACE_ ] = decimation(A_)

    N_ = size(A_,1);

    AS = zeros(N_);
    for i = 1:1:N_

        AS_(i,1:i) = flip(A_(i,1:i),2);
    end
    A  = A_'; AS = AS_';

    D = zeros(N_,N_,N_);

    for k = N_:-1:1
        for j = 1:1:N_
            for i = 1:1:N_           
                if( k == N_ )
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

    save("D.mat","D");

    D = load("D.mat"); D = D.D;
    
    D_ = flip(D,2);

    RA  = zeros(N_,N_,ceil(N_/2));
    RS  = zeros(N_,N_,ceil(N_/2));
    
    for k = 1:1:ceil(N_/2)
        for j = 1:1:N_
            for i = 1:1:N_
                if(D_(i,j,k))
    
                    RA(i,j,k) = A_(D_(i,j,k),j) ;   
                    RS(i,j,k) = AS_(D_(i,j,k),j);                  
                end   
            end
        end
    end   

    for k = 2:1:ceil(N_/2)
        ii = -k+1;
        for j = N_:-1:N_-k+2

            RA(:,j,k) = circshift(RA(:,j,k),ii);
            RS(:,j,k) = circshift(RS(:,j,k),ii);
            ii = ii + 1; 
        end       
    end 

    RAF = flip(RA,2);
    RSF = flip(RS,2);

    for k = 2:1:ceil(N_/2)
        for j = 2:1:N_-1
            
            I            = size(find(RAF(:,j,k)),1);
            RAF(1:I,j,k) = flip(RAF(1:I,j,k),1);
            RSF(1:I,j,k) = flip(RSF(1:I,j,k),1);
        end
    end
 
end   