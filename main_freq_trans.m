import freq_trans.T2F
what freq_trans.T2F
%% define
Fs = 1000; %sampling frequency
T = 1/Fs; %sampling period
L = 1500; %length of signal
t = (0:L-1)*T;
st = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
st = st + 2*rand(size(t));% add noise

%% calculate
[f, sf] = T2F(t,st)

%%plot
subplot(211)
plot(t,st)
xlabel('time/s')
ylabel('amplitude')
title('$$ s(t) = 0.7sin(2\pi*50t) + sin(2\pi*120t)+2X(t)$$','interpreter','latex')
subplot(212)
plot(f,sf)
xlabel('frequency/hz')
ylabel('amplitude')
