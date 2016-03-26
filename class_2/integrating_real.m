data;

% first order inertial system
% G(s) = k / (T * s  + 1)

numerator = [0, 0, k];
denominator = [T_i * T, T_i, 0];
% [num den] = eqtflength(numerator, denominator);
num = numerator;
den = denominator;
[y_s, x_s, time_s] = step(num, den);
[y_i, x_i, time_i] = impulse(num, den);


figure();
% figure(gig_inertial_fst_ord);
plot(time_s, y_s);
figure();
plot(time_i, y_i);

object = tf(numerator, denominator);
figure();
nyquist(object);
figure();
bode(object)