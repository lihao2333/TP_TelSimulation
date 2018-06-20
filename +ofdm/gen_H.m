%% 产生信道矩阵, N行, N列
%	input:
%		N: 矩阵的行列数, 载波的个数
%		Delay:	各径延时
%		Weights:	各径权重,  会自动进行归一化
%	output:
%		H:	信道矩阵
function H = gen_H(N, Delays, Weights)
	Max_delay = max(Delays);
	for i = 1:length(Delays)
	  delay = Delays(i);
	  weight = Weights(i);
	  temp(delay+1) = weight;
	end
	temp = temp/norm(temp);
	temp = fliplr(temp);
	temp = [zeros(1,N-Max_delay-1) temp];
	temp = circshift(temp,[0,1]);
	H = toeplitz([temp(1), fliplr(temp(2:end))], temp);
end
