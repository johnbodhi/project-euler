function [ D, E ] = classifier( dataSet_ )
    
    global RA Q Supervision

    D = 0; E = 0;

    for i = 1:1:size(dataSet_,1)

        % Store an RGB pixels of contained in the image of length 
        % imageLength to pass into the Gradient.

        dataSet(1,1:size(dataSet_,2)) = dataSet_(i,1:size(dataSet_,2));  

        dataSet = frameSplit(dataSet); % Duplicate and re-label each frame.

        l_ = dataSet(:,end,:);

        % We can utilize non-stationary RA during classification to
        % monitor dissimilarity between objects.

        RA = Q; % We need to reset RA between classes...

        dataSet = kmeans(dataSet); % k-means the split frame.

        fD_ = frameDecision(dataSet); D = D + 1; % classify frame with the gradient. 

        % We need an F1 metric which doesn't depend the on accumulating
        % TP, and FP. We can decompose the averages to observe the constituents,
        % and compare minimums statistically via walk values in phase space.
        
        if( Supervision )

            % Supervised Error...
            
            if ( fD_ ~= dataSet(i,size(dataSet,2)) )
    
                E = E + 1;
            end
    
            % Display observation type, classifier decision, 
            % cumulative decision per
            % class, and cumulative error per class...
    
            J = [ dataSet(i,size(dataSet,2)) fD_ D E ]; % disp( J )            
        else

            % Unsupervised Error...
    
            if ( fD_ ~= l( i, 1 ) )
            
                E = E + 1;
            end

            % Display observation type, classifier decision, 
            % cumulative decision per
            % class, and cumulative error per class...
               
            J = [ l(i,1) fD_ D E ]; disp( J )
        end

        dataSet = zeros(1,size(dataSet,2),size(dataSet,3));
    end
end