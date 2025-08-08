function [NEXPSPACE_,N_] = trellis()
    
    % A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv");
    A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
    % A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv");    
    
    N_ = size(A,1);

    AS = zeros(N_);
    for i = 1:1:N_

        AS(i,1:i) = flip(A(i,1:i),2);
    end
    A  = A'; AS = AS';

    D = zeros(N_,N_,N_);

    % for k = N:-1:1
    %     for j = 1:1:N
    %         for i = 1:1:N           
    % 
    %             if( k == N )
    %                 cc = 0;
    %                 for jj = 1:1:N
    %                     for ii = 1:1:N
    %                         if( ii == jj )
    %                             D( k - cc, jj, k ) = k - cc;
    %                             cc = cc + 1;
    %                         end
    %                     end
    %                 end
    % 
    %             elseif( k < N || k > 1 )
    % 
    %                 hh = N - k + 1; 
    %                 dd = 1;
    %                 for p = k:-1:1
    %                     D( p, dd:hh, k ) = p;
    %                     dd = dd + 1;
    %                     hh = hh + 1; 
    %                 end                
    % 
    %             elseif( k == 1 )
    % 
    %                 for j = 1:1:N
    %                     for i = 1:1:N
    %                         if( i == N )
    %                             D( N, j, k ) = k;
    %                         end
    %                     end
    %                 end
    % 
    %             end
    % 
    %         end
    %     end
    % end

    % save("D.mat","D");

    D = load("D.mat"); D = D.D;
    
    D = flip(D,2);

    [ NEXPSPACE_ ] = decimate(A,AS,D,N_); 