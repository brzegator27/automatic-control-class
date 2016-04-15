K_1 = 30;
K_2 = 250;

num_1 = K_1;
num_2 = K_2;
den = [1, 12, 20, 0];

sys_1 = tf(num_1, den);
nyquist(sys_1);

sys_2 = tf(num_2, den);
figure();
nyquist(sys_2);



