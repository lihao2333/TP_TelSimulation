%% 通过老方式完成一个frame的ofdm, 输入和输出都是调制信号
%	input:
%		X:	调制后的发送信号, 格式为[preamble, x1, x2...], preamble, xn 都是列向量
%		Delays:	多径延时
%		Weights:	权值
%		W:噪声矩阵
%	output:
%		Y:	输出序列
function Y = way_matrix(X, H,  W)
	import ofdm.gen_H;
	import ofdm.gen_F;

	
	[NumCarry, NumSymble] = size(X);
	[F, Fi] = gen_F(NumCarry);
	Y = F*(H*(Fi*(X)))+F*W;

	Hi = Y(:,1)./X(:,1);
	Hi = repmat(Hi,[1,NumSymble]);
	Y = Y./Hi;
end
