num_1 = [1, 1];
num_2 = [1, 1, 0];
num_3 = [1, 1, 0, 0];
num_4 = [1, 1, 0, 0, 0];

sys_1 = tf(1, num_1);
sys_2 = tf(1, num_2);
sys_3 = tf(1, num_3);
sys_4 = tf(1, num_4);

figure();
subplot(2, 2, 1);
nyquist(sys_1);
subplot(2, 2, 2);
nyquist(sys_2);
subplot(2, 2, 3);
nyquist(sys_3);
subplot(2, 2, 4);
nyquist(sys_4);