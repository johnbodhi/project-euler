function [RA_,RAF_,RS_,RSF_,N_] = trellis()
    
    % A_ = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv");
    A_ = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
    % A_ = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv");    
    
    % [EXPSPACE_] = decimation(A); 

    N_ = size(A_,1);

    AS_ = zeros(N_);
    for i = 1:1:N_
        
        AS_(i,1:i) = flip(A_(i,1:i),2);        
    end
    A_  = A_'; AS_ = AS_';

    % D = zeros(N_,N_,N_);

    % for k = N_:-1:1
    %     for j = 1:1:N_
    %         for i = 1:1:N_           
    %             if( k == N_ )
    %                 cc = 0;
    %                 for jj = 1:1:N_
    %                     for ii = 1:1:N_
    %                         if( ii == jj )
    %                             D( k - cc, jj, k ) = k - cc;
    %                             cc = cc + 1;
    %                         end
    %                     end
    %                 end
    %             elseif( k < N_ || k > 1 )
    %                 hh = N_ - k + 1; 
    %                 dd = 1;
    %                 for p = k:-1:1
    %                     D( p, dd:hh, k ) = p;
    %                     dd = dd + 1;
    %                     hh = hh + 1; 
    %                 end                
    %             elseif( k == 1 )
    % 
    %                 for j = 1:1:N_
    %                     for i = 1:1:N_
    %                         if( i == N_ )
    %                             D( N_, j, k ) = k;
    %                         end
    %                     end
    %                 end
    %             end
    %         end
    %     end
    % end
    % 
    % save("D.mat","D");

    D = load("D.mat"); D = D.D;
    
    D_ = flip(D,2);

    RA_  = zeros(N_,N_,ceil(N_/2));
    RS_  = zeros(N_,N_,ceil(N_/2));
    
    for k = 1:1:ceil(N_/2)
        for j = 1:1:N_
            for i = 1:1:N_
                if(D_(i,j,k))
    
                    RA_(i,j,k) = A_(D_(i,j,k),j) ;   
                    RS_(i,j,k) = AS_(D_(i,j,k),j);                  
                end   
            end
        end
    end   

    RAF_ = flip(RA_,2);
    RAF_ = swap(RAF_) ;
    RSF_ = flip(RS_,2);
    RSF_ = swap(RSF_) ;