%% 产生高斯白噪声矩阵, N行, L列
%% 	input:
%%		N:矩阵的行数, 载波的个数
%%		L:矩阵的列数, 发送的次数
%%		SNR_db:信噪比(dB), 并且假定信号平均功率为1
%%	output:
%%		W:噪声矩阵
function W = gen_W(N, L, SNR_db)
	SNR_linear = 10^(SNR_db/10);
	Noise_power = 1/SNR_linear;
	Noise_amp = sqrt(Noise_power/2);
	W = randn(N,L);
	W = W*Noise_amp;
end

