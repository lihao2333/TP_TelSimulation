%% 产生信道矩阵, N行, N列
%	input:
%		NumCarry: 矩阵的行列数, 载波的个数
%		Delay:	各径延时
%		Weights:	各径权重,  会自动进行归一化
%		NumCP:循环前缀数量
%	output:
%		H:	信道矩阵
function H = gen_H_old(NumCarry, Delays, Weights, NumCP)
	Max_delay = max(Delays);
	for i = 1:length(Delays)
	  delay = Delays(i);
	  weight = Weights(i);
	  temp(delay+1) = weight;
	end
	temp = temp/norm(temp);
	temp = fliplr(temp);
	temp = [temp  zeros(1,NumCarry+NumCP-1)];
	H = toeplitz([temp(1), fliplr(temp(2:end))], temp);
	H = H(1:NumCarry+NumCP,:);
end
