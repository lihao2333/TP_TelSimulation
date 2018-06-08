%% 功能:根据信噪比和信号功率计算噪声功率
% input:
%	snr_log:对数形式的形噪比
%	sig_pwr:信号的功率
% output:
%	noise_amp:噪声的幅度，可以送入add_noise函数
function noise_amp=get_noiseAmp(snr_log,sig_pwr)
	snr_linear = 10^(snr_log/10);
	noise_pwr = sig_pwr/snr_linear;
	noise_amp = sqrt(noise_pwr/2);
end
