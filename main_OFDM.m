clear;clc;
import ofdm.way_matrix
import ofdm.way_matrix_old
import ofdm.modulation
import ofdm.gen_H
import ofdm.gen_H_old
import ofdm.gen_W
import ofdm.gen_X
rng(100)
Delays = [0 1 2];MaxDelay = max(Delays);
Weights = [3 4 5];
NumCarry = 10;
NumCP = 2;
NumSymble = 4;
Mod_level = 4;
SNR_db = 10;
X_bits = gen_X(NumCarry, NumSymble*2);
X_data = ofdm.modulation(X_bits, Mod_level);

W = gen_W(NumCarry, NumSymble, SNR_db);

H = gen_H(NumCarry, Delays, Weights);
H_old = gen_H_old(NumCarry, Delays, Weights, NumCP);

Y_data = way_matrix(X_data, H , W);
Y_data_old = way_matrix_old(X_data, H_old , W, NumCP, MaxDelay);

Y_bits = ofdm.demodulation(Y_data, Mod_level);
Y_bits_old = ofdm.demodulation(Y_data_old, Mod_level);
diff_Y_Y_old=sum(sum(Y_bits~=Y_bits_old));
dif_Y_X=sum(sum(Y_bits~=X_bits));
sprintf('两种方法得到的Y_bits差异值为%d', diff_Y_Y_old)
sprintf('在SNR_DB=%d的情况下, 误比特个数为%d',SNR_db, dif_Y_X)

