function [f,sf]=T2F(t,st)
% 对信号进行傅里叶变换，输出单边频谱
L = length(t)
Fs = 1/(t(2)-t(1))
sf = fft(st);
sf = abs(sf/L);
sf = sf(1:L/2+1);
sf(2:end-1) = 2*sf(2:end-1);
f = Fs*(0:(L/2))/L;
