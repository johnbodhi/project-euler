function [ RA, RS, D ] = trellis()
    
    % A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_tiny.csv");
    % A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_small.csv"); 
    A = readmatrix("C:\Users\jmgar\OneDrive\Documents\GitHub\project-euler\Project_Euler_Problem_67\MaximumPathSumII\MaximumPathSumII\Matrices\triangle_large.csv"); 
    
    N = size(A,1); M = size(A,2);

    %{
    N = 8; M = N; 
    for j = 1:M
        for i = 1:N
             if( i < j || i == j)
     
                A( i, j ) = randi( [ 1, 100 ] );
                % A( i, j ) = 0;
             end
         end
    end
    A = A';
    %}
   
    AS = zeros(size(A,1),size(A,2));
    for i = 1:1:size(A,1)

        AS(i,1:i) = flip(A(i,1:i),2);
    end

    A  = A';
    AS = AS';

    D = zeros( size(A,1), size(A,2), size(A,1) );

    % for k = size( D, 3 ):-1:1
    %     for j = 1:1:size( D, 2 )
    %         for i = 1:1:size( D, 1 )               
    % 
    %             if( k == size(D,3) )
    %                 cc = 0;
    %                 for jj = 1:size(D,2)
    %                     for ii = 1:size(D,1)
    %                         if( ii == jj )
    %                             D( k - cc, jj, k ) = k - cc;
    %                             cc = cc + 1;
    %                         end
    %                     end
    %                 end
    % 
    %             elseif( k < size(D,2) || k > 1 )
    % 
    %                 hh = size(D,2) - k + 1; 
    %                 dd = 1;
    %                 for p = k:-1:1
    %                     D( p, dd:hh, k ) = p;
    %                     dd = dd + 1;
    %                     hh = hh + 1; 
    %                 end                
    % 
    %             elseif( k == 1 )
    % 
    %                 for j = 1:size(D,2)
    %                     for i = 1:size(D,1)
    %                         if( i == size(D,1) )
    %                             D( size(D,1), j, k ) = k;
    %                         end
    %                     end
    %                 end
    % 
    %             end
    %         end
    %     end
    % end

    % save("D.mat","D");
     
    D = load("D.mat"); D = D.D;
    
    D = flip(D,2);
    
    RA = zeros(N,M); 
    RS = zeros(N,M);
    
    for k = 1:ceil(size(D,3)/2)
        for j = 1:size(D,2)
            for i = 1:size(D,1) 
    
                if(D(i,j,k))
    
                    RA(i,j,k) = A(D(i,j,k),j);
    
                    RS(i,j,k) = AS(D(i,j,k),j);
                end    
    
            end
        end
    end    
    RA = circshift(RA,1,1);
    RS = circshift(RS,1,1);
    
end