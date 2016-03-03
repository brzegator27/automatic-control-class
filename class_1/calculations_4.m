zeros = [];
poles = [-1 -1 -1 -1 -1 -1 -1 -1 -1 -1];
gain = 1;

[numerator, denominator] = zp2tf(zeros, poles, gain);
[zeros_1, poles_1, gain_1] = tf2zp(numerator, denominator);

zeros_1
poles_1
gain_1

% output:
% zeros_1 =
% 
%    Empty matrix: 0-by-1
% 
% 
% poles_1 =
% 
%   -1.0461          
%   -1.0377 + 0.0269i
%   -1.0377 - 0.0269i
%   -1.0148 + 0.0443i
%   -1.0148 - 0.0443i
%   -0.9857 + 0.0446i
%   -0.9857 - 0.0446i
%   -0.9621 + 0.0276i
%   -0.9621 - 0.0276i
%   -0.9532          
% 
% 
% gain_1 =
% 
%      1