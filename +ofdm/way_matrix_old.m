%% 通过矩阵的方式完成一个frame的ofdm, 输入和输出都是调制信号
%	input:
%		X:	调制后的发送信号, 格式为[preamble, x1, x2...], preamble, xn 都是列向量
%		H:	信道矩阵
%		W:噪声矩阵
%	output:
%		Y:	输出序列
function Y = way_matrix_old(X, H,  W, NumCP, MaxDelay)
	import ofdm.gen_H;
	import ofdm.gen_F;

	
%	X = [X(end-(NumCP+MaxDelay-1):end,:);X];
	[F, Fi] = gen_F(size(W,1));

	X_time = (Fi*(X));
	X_time_CP_Delay = [X_time(end-(NumCP+MaxDelay-1):end,:);X_time];
	X_time_CP_H = H*X_time_CP_Delay ;
	X_time_H_W = X_time_CP_H(1+(NumCP):end,:)+W;
	Y = F*X_time_H_W;

	Hi = Y(:,1)./X(:,1);
	Hi = repmat(Hi,[1,size(X,2)]);
	Y = Y./Hi;
end
