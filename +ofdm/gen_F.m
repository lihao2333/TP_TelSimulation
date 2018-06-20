%% 产生N阶fft,ifft矩阵, 进行归一化的
%% input N
%% ouput 
%%		F:N阶fft矩阵
%%		F_i:N阶ifft矩阵
function [F, Fi] = gen_F(N)
	[n, k] = meshgrid(1:N, 1:N);
	F = exp(-j*2*pi.*(k-1).*(n-1)./N)./sqrt(N);
	Fi = 1/N.*exp(j*2*pi.*(k-1).*(n-1)./N).*sqrt(N);
end

