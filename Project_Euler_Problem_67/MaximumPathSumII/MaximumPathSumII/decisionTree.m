clear all; close all; clc; tic

global N

[ RA, RS, D ] = trellis();

Z = diag(flip(pascal(N),2));

S  = zeros(1,2);
SS = zeros(1,2);

Q = 0; P = 0; K = 1;

for U = 1:1:ceil(N/2)

    while( P < Z(U) )

        B  = genFun(U);

        SS = dT(B);

        % for i = 1:1:size(B,1)
        % 
        %     if( sum(B(i,:),2) == Q )
        % 
        %         P = P + 1;
        % 
        %         ii = 2; jj = 1;
        % 
        %         S( 1 ) = RA(ii,jj,Q+1);
        %         S( 2 ) = RS(ii,jj,Q+1);
        % 
        %         for j = 1:1:size(B,2)
        % 
        %             if( ~B(i,j) )
        % 
        %                 if( jj <= N-1 )
        % 
        %                     jj = jj + 1; 
        % 
        %                     S( 1 ) = S( 1 ) + RA(ii,jj,Q+1);
        %                     S( 2 ) = S( 2 ) + RS(ii,jj,Q+1);
        % 
        %                 end           
        % 
        %                 elseif( B(i,j) )
        % 
        %                 if( ii > 1 && jj <= N-1 )
        % 
        %                     ii = ii + 1;
        % 
        %                     jj = jj + 1;    
        % 
        %                     S( 1 ) = S( 1 ) + RA(ii,jj,Q+1);
        %                     S( 2 ) = S( 2 ) + RS(ii,jj,Q+1);
        % 
        %                 end    
        %             end 
        %         end
        %     end
        % 
        %     if( S( 1 ) >= S( 2 ) )
        % 
        %         S( 2 ) = 0;
        %     elseif( S( 1 ) < S( 2 ) )
        % 
        %         S( 1 ) = S( 2 );
        %     end
        % 
        %     SS( 2 ) = S( 1 );
        % 
        %     if( SS( 1 ) >= SS( 2 ) )
        % 
        %         SS( 2 ) = 0;
        %     elseif( SS( 1 ) < SS( 2 ) )
        % 
        %         SS( 1 ) = SS( 2 );
        %     end
        % 
        % end
        % K = K + 1;

    end
    Q = Q + 1; P = 0; K = 1;

end
H = max(SS); toc;