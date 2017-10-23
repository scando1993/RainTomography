%% Rain Tomography
tic
N = 64;
L = 20;
a0 = 150;
b0 = 70;
eps = 0.001;
l = 10; 
rm = [[2 6 10 15]; [6 11.2 15 5]; [11.2 18 5 10]];
% p = [Att1(1) Att2(1) Att3(1)]';

A = a_matrix(rm, N, L);
B = b_matrix(sqrt(N));
% k = iterative_algorithm(A, B, p, b0, a0, N, eps, l);

% A = a_matrix(rm, N, L);
% B = b_matrix(N);
% 
k = 0;
% 
for i = 1:length(Att1)
    p = [Att1(i) Att2(i) Att3(i)]';
    k0 = iterative_algorithm( A, B, p, b0, a0, N, eps, l);
    k = k + k0; 
end

K = zeros(L,L);

for x = 1:L+1
    for y = 1:L+1
        K(x,y) = rain_tomography_func( x-1, y-1, N, L, k );
    end
end

toc
figure
contourf(K');