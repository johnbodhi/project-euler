function [ RA ] = CNN( A_ )
    
    ii = 2; ij = 3;

    BPI = [ ii ij ];


    classType = [ 0 0 ]; classGroups = [ 0 0 0 ];

   
    N   = size(classType,2);
    
    M   = size(classGroups,2);

    O   = size(A_,1); 

    P   = size(A_,2);


    for j = 1:1:O
           
        TL_(:,j) = (1:1:O); % Sample tracking labels (supervision).
    end


    CONTAINMENT = floor( 0.50 * N );
    
    V   = zeros(N-CONTAINMENT, M);
    
    IT  = size(V,1)^M;
    
    
    B   = zeros(size(A_,1),N);

    
    X   = zeros(N,M+1,O);
    

    % Convolution with a sub-gradient!!

    aa = 1; bb = 1; 
    
    T  = 1.0;

    while( sum(sum(B,1),2) < IT )

        if( aa <= size(V,1) )

            B(aa,1) = 1;

            for q = 1:1:N
                
                % We can utilize Monte Carlo methods
                % in a stencil to hasten convergence.
                
                A = cat(2,A_,TL_);
                
                F = monteCarlo(A); A = 0;
                
                F = F(:,1:end-1); TL_(:,1) = F(:,end); 
                
                
                RA(BPI(1,1),2:end,2) = W(1,:,1).*mean(F(1:aa,:),1); 
                
                BFLAG = 1; % Back propagation condition for k-means.

    
                [ D, E ] = classifier( F );
                
                [ ~, ~, ACC, ~ ] = fMeasure( D, E ); 


                if( ACC >= T )
                
                    X(BPI(1,1),1:end-1,1) = RA(:,:,:); aa_ = aa;

                    [ X ] = subGradient( X );

                    Q = X; % Filter reset.
                end
                A_  = circshift(A_,1); TL_ = circshift(TL_,1);
                
            end
            aa = aa + 1;

        elseif( aa >= size(V,1) && bb < size(V,1) )

            B(bb,2) = 1; B(:,1) = 0;

            for q = 1:1:N
                
                A = cat(2,A_,TL_);
                
                F = monteCarlo(A); A = 0;
                
                F = F(:,1:end-1); TL_(:,2) = F(:,end); 
                
                 
                RA(BPI(1,2),2:end,2) = W(2,:,1).*mean(F(1:bb,:),1);

                BFLAG = 0;
               

                [ D, E ] = classifier( F );
                
                [ ~, ~, ACC, ~ ] = fMeasure( D, E ); 

                if( ACC >= T )

                    X(BPI(1,2),1:end-1,1) = RA(:,:,:); bb_ = bb;

                    [ X ] = subGradient( X );

                    Q = X; % Filter reset.                    
                end
                A_  = circshift(A_,1); TL_ = circshift(TL_,1);
                
            end     
            bb = bb + 1; aa = 1; 
            
        end
        % We need to increment the backpropagation indexes by two for the
        % next set of comparisons, and reset the dual space walk index.
        ii = ii + 2; ij = ij + 2; jj = 1;

    end
    RA = Q;
    
end