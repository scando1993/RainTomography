function [ B ] = b_matrix( N )
%UNTITLED3 Summary of this function goes here
%   N is the n partitions

% for i = 1 : N
%     Sb(i) = i;
%     Sb(i+N) = i*N;
%     Sb(i+2*N) = N*N - N + i;
% end

Sb = [1:N (1:N).*N (N*N-N+1:N*N) (0:N-1).*N+1];

S = setdiff(1:( N*N ), Sb);

% B = S;

B = zeros(N*N,N*N);

    for i = 1:length(S)
        Sj = [i-N-1, i-N, i-N+1, i-1, i+1, i+N-1, i+N+1];
        Bi = zeros(N*N,N*N);
        for j = 1:N*N
            for k = 1:N*N
                Bi(j,k) = b_coefficients(i,j,k,Sj);
            end
        end
        B = B + Bi;
    end
end

