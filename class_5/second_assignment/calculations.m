% G(s) = 1 / s * (s + 1) * (0.2s + 1)
num = 1;
den = [0.2, 1.2, 1, 0];

% rlocus(num, den);
% line([0, -100], [0, 100])
% sgrid;
% [K, poles] = rlocfind(num, den);

K = 0.4057;

sys = tf(num * K, den);
sys_closed = feedback(sys, 1);
figure();
step(sys_closed);


% G_c(s) = (s + 1) / (0.1s + 1)
num_c = [1, 1];
den_c = [0.1, 1];

sys = tf(num, den);
sys_c = tf(num_c, den_c);

sys_with_c = series(sys, sys_c);

% rlocus(sys_with_c);
% line([0, -100], [0, 100])
% sgrid;
% [K, poles] = rlocfind(num, den);

K_sys_with_c = 4.0676;

sys_with_c_K_c = series(tf(num * K_sys_with_c, den), tf(num_c, den_c));
sys_with_c_closed = feedback(sys_with_c_K_c, 1);
hold on;
step(sys_with_c_closed);

