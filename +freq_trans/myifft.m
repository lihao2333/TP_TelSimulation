%% 通过矩阵的形式定义ifft
%% x为列向量,y=W(N)*x
function y=myifft(x,n)
	[N,K] = meshgrid(1:n,1:n);
	W = exp(j*2*pi*(N-1).*(K-1)./n);
	y=W*x;
	y = y/n;
end
