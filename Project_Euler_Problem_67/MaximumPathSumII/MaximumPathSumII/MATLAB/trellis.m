function [N_,L_] = trellis()
    
    % A_ = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv") ;
    % A_ = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
    % A_ = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv");    

    % N_ = 8; M_ = N_;
    % for j = 1:1:M_
    %     for i = 1:1:N_
    %         if( i >= j )
    % 
    %             A_(i,j) = randi([1,99]);
    %         end
    %     end
    % end

    % N_  = size(A_,1);

    % AS_ = zeros(N_) ;
    % for i = 1:1:N_

    %     AS_(i,1:i) = flip(A_(i,1:i),2);
    % end
    % A_  = A_'; AS_ = AS_';

    % D = zeros(N_,N_,N_);
    % for k = N_:-1:1
    %     for j = 1:1:N_
    %         for i = 1:1:N_           
    %             if(k == N_)
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
    % save("D.mat","D");

    % D = load("D.mat"); D = D.D;
 
    % D_ = flip(D,2);

    % RAA_  = zeros(N_,N_,ceil(N_/2));
    % RSA_  = zeros(N_,N_,ceil(N_/2));
    % 
    % for k = 1:1:ceil(N_/2)
    %     for j = 1:1:N_
    %         for i = 1:1:N_
    %             if(D_(i,j,k))
    % 
    %                 RAA_(i,j,k) = A_ (D_(i,j,k),j);   
    %                 RSA_(i,j,k) = AS_(D_(i,j,k),j);                  
    %             end   
    %         end
    %     end
    % end   

    % RAB_ = flip(RAA_,2);
    % RAC_ = smudge(RAB_);
    % RAD_ = swap(RAC_,1);
    % RAE_ = swap(RAD_,2);

    % RSB_ = flip(RSA_,2);
    % RSC_ = smudge(RSB_);
    % RSD_ = swap(RSC_,1);
    % RSE_ = swap(RSD_,2);

    % L_(:,:,:,1)  = RAA_;
    % L_(:,:,:,3)  = RAB_;
    % L_(:,:,:,5)  = RAC_;
    % L_(:,:,:,7)  = RAD_;
    % L_(:,:,:,9)  = RAE_;

    % L_(:,:,:,2)  = RSA_;
    % L_(:,:,:,4)  = RSB_;
    % L_(:,:,:,6)  = RSC_;
    % L_(:,:,:,8)  = RSD_;
    % L_(:,:,:,10) = RSE_;

    % save("N_.mat","N_");

    % save("RAA_.mat","RAA_");
    % save("RSA_.mat","RSA_");

    % save("RAB_.mat","RAB_");
    % save("RSB_.mat","RSB_");

    % save("RAC_.mat","RAC_");
    % save("RSC_.mat","RSC_");

    % save("RAD_.mat","RAD_");
    % save("RSD_.mat","RSD_");
    
    % save("RAE_.mat","RAE_");
    % save("RSE_.mat","RSE_");

    % save("L_.mat","L_")    ;

    N_ = load("N_.mat"); N_ = N_.N_;
    L_ = load("L_.mat"); L_ = L_.L_;

    % L_ = foldLeaf(L_)      ;