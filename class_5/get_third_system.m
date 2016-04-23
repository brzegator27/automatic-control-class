function object = get_multiinertial_without_delay(k, T, n)

% % % % % % % % % % % % % % %
%           Model C         %
% % % % % % % % % % % % % % %

% multi-inertial without delay
% G(s) = k / (T * s  + 1) ^ n
num = k;

den_base = [T, 1];
den = den_base;
for i = 2:n
    den = conv(den, den_base);
end

object = tf(num, den);