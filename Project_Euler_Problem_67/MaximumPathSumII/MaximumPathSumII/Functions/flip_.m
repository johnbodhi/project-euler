clc; clear all; close all;

A = [ 1 0 0 0; 2 3 0 0; 4 5 6 0; 7 8 9 10 ];

N = size(A,1); M = size(A,2); 

R(:,:,1) = A;

jj = 1;
for i = N:-1:1

    if ( i > 2 )

        for j = i:-1:floor(N/2)+1

            L = A(i,j);

            A(i,j) = A(i,jj);

            A(i,jj) = L; jj = jj + 1;

        end
        jj = 1;

    else 

        for j = i:-1:floor(N/2)

            L = A(i,j);

            A(i,j) = A(i,jj);

            A(i,jj) = L; jj = jj + 1;

        end
        jj = 1;

    end

end

A = [ 1 0 0 0; 2 3 0 0; 4 5 6 0; 7 8 9 10 ];
      
jj = 1;
for i = N:-1:1
    for j = N:-1:floor(N/2)+1

        L = A(i,j);

        A(i,j) = A(i,jj);

        A(i,jj) = L; jj = jj + 1;
        
    end
    jj = 1;
end



N = 15; M = N; O = N;

for k = 1:1:O
    for j = 1:1:M
        for i = 1:1:N
      
            R(i,j,k) = k;
            
        end
    end
end


for k = 1:1:O
    
    R(:,:,k);
end



if ( mod(N,2) )
    
    kk  = floor(O/2) + 2;
    
    SUP = ( N - floor( floor(N/2) / 2 ) ) / 2;
    
    INF = floor(N/2) + SUP;
   
else
    
    kk = floor(O/2) + 1;
    
    SUP = floor( ( N - floor( floor(N/2) / 2 ) ) / 2 );
    
    INF = floor(O/2) + SUP;
    
end

for k = O:-1:INF
    
    for j = M:-1:1
        for i = N:-1:1
    
            L = R(i,j,k);

            R(i,j,k) = R(i,j,kk);

            R(i,j,kk) = L; 
            
        end
    end     
    
    kk = kk + 1;
    
end

for k = 1:1:O
    
    R(:,:,k);
end





