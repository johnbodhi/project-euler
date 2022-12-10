% We can find all legal paths though a tiangular trellis defined by a
% binary constraint.


% We can generate a lower triangular matirx that does not require a
% transpose...

% N = 15; M = N; 
% 
% A = zeros( N, M);
% 
% for j = 1:M
%     for i = 1:N
%         if( i <= j )
%             % A( i, j ) = 1;
%             % A( i, j ) = randi( [ 1,10 ] );
%         end
%     end
% end

A = readmatrix("triangle_small.csv"); 
% A = csvread("triangle_large.csv"); 

A = A';

% We need to generate an index map of matrix A...

I = zeros( size(A,1), size(A,2) );

for j = 1:1:size(A,2)
    for i = 1:1:size(A,1)

         I( i, j ) = i;

         if( i > j )
            I( i, j ) = 0;
        end
    end
end

% We can count up from the lower combination boundary toward the higher
% combination boundary, and select the combinations that satisfy Pascal's
% Matrix criterion...

N = 111111111111111; M = 123456789654321;

ii = 1; uu = 0;
for i = N:1:M

    R = i;

    for j = 1:1:floor(log10(R)+1)
            
        D(1,j) = R - floor( R / 10 ) * 10;

        R = floor(R / 10); 
    end

    X = size(find(D(1,:)),2);

    if( X == size(D,2) )
        
        F(1,:) = D(1,:);
       
        jj = 2;
        while( jj <= size(D,2) )
    
            if( F(1,jj) == F(1,jj-1) || F(1,jj) == F(1,jj-1) - 1 )
                uu = uu + 1;
            end
            jj = jj + 1;
        end        

        if( uu == size(D,2) - 1 )
            FF(ii,:) = F(1,:); 
            ii = ii + 1;
        end
        uu = 0;       
    end   
end
FF = flip(FF,2);

K = FF; 

% E = sum(diag(flip(pascal(15),1)));