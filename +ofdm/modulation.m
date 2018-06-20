%% 用于调制, 输入信号X=(x1, x2, ...), xn为列向量
%	input:
%		mod_in:	输入数据
%		mod_mode:	调制阶数
%	output:
function mod_out = modulation(mod_in, mod_mode)
	switch(mod_mode)
	case 2
	  mod_out = mod_in;
	  mod_out(mod_in==0) = -1;
	case 4
	  Temp = [-1-j -1+j 1-j 1+j];
	  N = size(mod_in,1);
	  mod_in = reshape(mod_in, 2, []);
	  mod_out = Temp([2 1]*mod_in+1)/sqrt(2);
	  mod_out = reshape(mod_out, N, []);
end

