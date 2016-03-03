calculations;

[A_1, B_1, C_1, D_1] = zp2ss(zeros, poles, gain);
                            % zp2ss converts a zero-pole-gain representation 
                            % of a given system to an equivalent 
                            % state-space representation.
                            % More on:
                            % http://uk.mathworks.com/help/signal/ref/zp2ss.html
                         
[A_2, B_2, C_2, D_2] = tf2ss(numerator, denominator);
                            % tf2ss converts the parameters of 
                            % a transfer function representation of 
                            % a given system to those of an equivalent 
                            % state-space representation.
                            % More on:
                            % http://uk.mathworks.com/help/signal/ref/tf2ss.html
                            
A_1
A_2

B_1
B_2

C_1
C_2

D_1
D_2

% We can clearly see, that some matrices are different
% A_1 =
% 
%    -0.5000   -0.6325
%     0.6325         0
% 
% 
% A_2 =
% 
%    -0.5000   -0.4000
%     1.0000         0
% 
% 
% B_1 =
% 
%      1
%      0
% 
% 
% B_2 =
% 
%      1
%      0
% 
% 
% C_1 =
% 
%          0    0.0016
% 
% 
% C_2 =
% 
%   1.0e-003 *
% 
%          0    1.0000
% 
% 
% D_1 =
% 
%      0
% 
% 
% D_2 =
% 
%      0

figure
step(A_1, B_1, C_1, D_1);
hold on
impulse(A_1, B_1, C_1, D_1);

figure
step(A_2, B_2, C_2, D_2);
hold on
impulse(A_2, B_2, C_2, D_2);

% from graphs we can see, that step and impulse responses are the same for
% both ap2ss and tf2ss

gain_01 = dcgain(A_1, B_1, C_1, D_1);
gain_01








