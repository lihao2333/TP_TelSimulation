%% 产生原始序列X(第一列为preamble) N行 L列, 以及preamble
% input:
%	N:载波数
%	L:数据长度
% output:
%	X:原始序列(第一列为preamble)
function X  = gen_X(N, L)
	X = randi([0 1], N, L);
end
