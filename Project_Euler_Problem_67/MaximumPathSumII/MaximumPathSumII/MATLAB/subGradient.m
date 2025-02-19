function [ X ] = subGradient( RA_ )

    ss = 0; jj = 1;
                    
    W_( jj ) =  BiCGSTAB_( RA_(BPI(1,1),:,:), [], [] ); jj = jj + 1; 

    % We need to reinforce exlusivity of the samples 
    % in the averages comprising the filter.

    if ( aa_ > bb )

        K = zeros(aa_,2);

        K(:,1) = TL_(1:aa,1); K(:,2) = TL_(1:bb,2);

        for i = 1:1:aa_

            if( K(i,1) == K(i,2) && K(i,1) ~= 0 && K(i,2) ~= 0 )

                ss = ss + 1;
            end

        end

    elseif ( aa_ < bb )

        K = zeros(bb,2);

        K(:,1) = TL_(1:aa,1); K(:,2) = TL_(1:bb,2);

        for i = 1:1:bb

            if( K(i,1) == K(i,2) && ( K(i,1) ~= 0 && K(i,2) ~= 0 ) )

                ss = ss + 1;
            end

        end
           
    end
    K = 0;

    % If the gradient exists for some subset of mutually exclusive
    % labels, we assign a new filter to the array of new filters that
    % have at least met the accuracy threshold criteria. We
    % can then choose which filter is most minimum, ie. the
    % prior classes dual subset.

    if( ~ss )

        X_(jj,1:end-1,1) = RA_(:,:,:);
    end

    if( q == N )
        
        [ ~, I ]  = min( W_(:,1) );
        
        X(BPI(1,2),1:end-1,1) = X_(I,:,:);

        % We need to remove the exclusive values of the
        % sample set from the pool to accelerate 
        % convergence of the convolution...

        uu = 1;
        for i = 1:1:size(A_,1)
            
            if( A_(i,end,1) ~= K(i,1) || A_(i,end,1) ~= K(i,2) )

                A(uu,:,1) = A_(i,:,1); uu = uu + 1;
            end                           
        end  
        N = size(A,1);
   
    end

end