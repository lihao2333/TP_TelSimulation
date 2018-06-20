%% 用于解调, 输入信号X=(x1, x2, ...), xn为列向量
%	input:
%		mod_in:	输入数据
%		mod_mode:	调制阶数
%	output:
function mod_out = demodulation(mod_in, mod_mode)
	switch(mod_mode)
	case 2
	  mod_out(abs(mod_in-1)<=abs(mod_in+1))=1;
	  mod_out(abs(mod_in-1)>abs(mod_in+1))=0;
	case 4
	  N = size(mod_in,1);
	  mod_in = reshape(mod_in, 1, []);
	  mod_out(1,:) = real(mod_in)>0;
	  mod_out(2,:) = imag(mod_in)>0;
	  mod_out = reshape(mod_out, N, []);
end

