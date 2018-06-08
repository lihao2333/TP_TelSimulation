%%单频信号经过多径时变信道
%  时延大小随时间变化，
%  这里的时变 是人为设定的； 实际中时变 大多因为移动性导致

clc
clear all;
import freq_trans.T2F

f=10  %频率(hz)
L=2;  %径数

t=0:0.01:10;
st=cos(2*pi*f*t);   % 原始单频信号
taof=2*rand(1,L);  %多普勒偏移   
fai0=rand(1,L)*2*pi; %每径的初始相位

for i=1:L
    fai(i,:)=2*pi*taof(i)*t;
    s(i,:)=cos(2*pi*f*t+fai(i,:)+fai0(i));
end
rt=sum(s)/sqrt(L);  % 将信号经过多径的结果相加

%---------信号频谱---------
[ff sf]=T2F(t,st);
[ff rf]=T2F(t,rt);

%-----------画图----------
figure(1)
subplot(221)
plot(t,st); xlabel('t');ylabel('s(t)');title('$s(t)=cos(2\pi*10t)$','interpreter','latex');
axis([0 10 -1.5 1.5]);
subplot(222)
plot(t,rt);xlabel('t');ylabel('r(t)');title('$r(t)=\sum _{i=0}^{L} cos(2\pi*(10+\Delta f _i)t+\phi _i)$','interpreter','latex');
subplot(223)
plot(ff,sf);xlabel('f');ylabel('s(f)');
title('$s(f)$','interpreter','latex');
axis([0 20 0 1]);
subplot(224)
plot(ff,rf);xlabel('f');ylabel('r(f)');
axis([0 20 0 1]);
title('$r(f)$','interpreter','latex');
