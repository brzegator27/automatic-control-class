function object = get_first_system(k, T, theta)

% % % % % % % % % % % % % % %
%         Fst System        %
% % % % % % % % % % % % % % %

% G(s) = 1 / (s + 1) * (5s + 1)
num = 1;
den = [5, 6, 1];

object = tf(num, den);