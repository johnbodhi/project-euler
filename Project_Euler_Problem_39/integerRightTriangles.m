close all; clear all; clc; tic

ii = 1;
p = zeros(1,1);
for i = 1:1:1000
    for j = 1:1:1000

        k = sqrt( i^2 + j^2 );

        s = 1e4 * k - fix( k ) * 1e4;

        if( ~s )
            if( i + j + k <= 1000 )
                p(ii) = i + j + k;
                ii = ii + 1;
            end
        end
    end
end
B = mode(p); toc;