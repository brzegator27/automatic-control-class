K= 10;
T_1 = 0.1;
T_2 = 0.5;
T_3 = 0.8;

num_1 = K;
num_2 = K;

den_1 = [T_1*T_2, T_1 + T_2, 1];
den_2 = [T_1*T_2*T_3, T_1*T_2 + T_1*T_3 + T_2*T_3, T_1 + T_2 + T_3, 1];

sys_1 = tf(num_1, den_1);
sys_2 = tf(num_2, den_2);

nyquist(sys_1, sys_2);
