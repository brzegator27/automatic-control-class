K = 2;
T_1 = 0.1;
T_2 = 0.9;
T_d = 0.7;

num_1 = K;
num_2 = [K * T_d, K];

den = [T_1 * T_2, T_1 + T_2, 1, 0];

sys_1 = tf(num_1, den);
sys_2 = tf(num_2, den);

nyquist(sys_1);
figure();
nyquist(sys_2);

