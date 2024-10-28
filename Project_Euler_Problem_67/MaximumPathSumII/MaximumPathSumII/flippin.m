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

R(:,:,2) = A;

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

R(:,:,3) = A

R(:,:,4) = A'

kk = floor(N/2)+1;
for k = N:-1:floor(N/2)+1
    for i = N:-1:1
        for j = N:-1:1
    
            L = R(i,j,k);
                
            R(i,j,k) = R(i,j,kk);
                
            R(i,j,kk) = L; 
             
        end        
    end
    kk = kk + 1;
end

R(:,:,3)

R(:,:,4)