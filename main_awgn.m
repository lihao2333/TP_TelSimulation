%% example of AWGN

clear
clc
tic
import mod_demod.modulation
import mod_demod.demodulation
import noise.add_noise
import noise.get_noiseAmp
help noise
%%% ---------- simulation parameter ---------------------------

modLevel=4;% 调制阶数
num_bit=100;      %% bit数

SNR_Arr= [0:2:10];
numSNR=length(SNR_Arr);
numFrame_Arr= ones(1,numSNR)*1500;
TsigPower=1;% 信号功率为1

for ns=1:numSNR
    %% -------------------------------------
    SNR=SNR_Arr(ns);
    numFrame=numFrame_Arr(ns);   
    
	NoiseAmp = get_noiseAmp(SNR, TsigPower);
      
    %%-------initialization----------
    num_total_error=0;
    
    for nf=1:numFrame
        %% ----------------发送端--------------------
        %---------随机产生数据---------------------------
        seriBit =randi([0 1],1,num_bit);
        
        %%-------- QPSK 调制 -----------------------------
        DataModed=modulation(seriBit,modLevel);       
        
        %% ******************** 信道 *********************************************      
        % -----add gaussian noise-----------------
        Rdata=add_noise(DataModed,NoiseAmp);
        
        %% ******************** 接收端 *********************************************     
        % ------------QPSK demodulation---------------------
        BitDemoded=demodulation(Rdata,modLevel);
        
        % ------- calculate BER --------------------
        num_error_bit=sum(abs(seriBit-BitDemoded));
        num_total_error=num_total_error+num_error_bit;
        
        
    end   %% end for nf
    BER(ns) = num_total_error/(num_bit*nf);
    
end  %% end for ns

semilogy(SNR_Arr,BER,'r-');
xlabel('SNR');ylabel('BER');
title('awgn下，BER vs SNR')
