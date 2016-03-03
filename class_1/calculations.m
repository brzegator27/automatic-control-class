% read in constants from data.m
data;

% transmittance

% we've got
% G(s) = 1 / (M * s^2 + alfa * s + c), so
numerator = [0 0 1];
denominator = [massConst damperConst springConst];

step(numerator, denominator);       % step response of dynamic system
                                    % more about setp function on
                                    % uk.mathworks.com/help/control/ref/step.html
                                    
impulse(numerator, denominator);    % impulse response of dynamic system
                                    % more about impulse function on
                                    % uk.mathworks.com/help/control/ref/impulse.html
                                    
% we can also create real- or romplex-valued transfer function model 
% (TF object) and e.g. pass it to step or impulse function. 
% More about tf function on uk.mathworks.com/help/control/ref/tf.html
object = tf(numerator, denominator);

step(object);
impulse(object);

% we can show object properties using get function
get(object);



% in accordance with uk.mathworks.com/help/signal/ref/tf2zp.html, given a
% SIMO continuous-time system in polynomial transfer function form we can
% use output of tf2zp to produce the single-input, multi-output (SIMO)
% factored transfer function form.
fvtool(numerator, denominator, 'polezero'); % opens FVTool and displays the 
                            % magnitude response of the digital filter defined
                            % with numerator and denominator. 
                            % More about this function on 
                            % uk.mathworks.com/help/signal/ref/fvtool.html#zmw57dd0e62094
                            
[num den] = eqtflength(numerator, denominator);
[zeros poles gain] = tf2zp(num, den);   % transfer function to zero-pole
                            % More about this function on 
                            % uk.mathworks.com/help/signal/ref/tf2zp.html
                            
text(real(zeros) + .1, imag(zeros), 'Zero');
text(real(poles) + .1, imag(poles), 'Pole');    % function text add text
                            % descritptions to data points
                            % more on uk.mathworks.com/help/matlab/ref/text.html

% we can also plot zeros and poles using pzmap function
% pzmap(numerator, denominator);
% pzmap(poles, zeros);
% pzmap(object);              % more on uk.mathworks.com/help/control/ref/pzmap.html

grid on

% we've got
% G(s) = 1 / (M * s^2 + alfa * s + c), which we can write as
% G(s) = K / (T^2 * s^2  + 2 * T * xi * s + 1), where:
K = 1 / springConst;                % gain
T = sqrt(massConst / springConst);  % time constant
xi = damperConst / (2 * sqrt(springConst * massConst));
                                    % damping coefficient
                                    
% if xi < 1 system is oscillational
% if xi >= 1 system is attenulated
%
% poles =
% 
%   -0.2500 + 0.5809i
%   -0.2500 - 0.5809i
% poles imaginary part is different from zero
%
% xi =
% 
%     0.3953
% so system is oscillational
% 
% zeros =
% 
%    Empty matrix: 0-by-1
%   
% so system doesn't have zeros in right half-plane 
% thus system is not minimal-phase

% factored transfer function form of
% G(s) = 1 / (M * s^2 + alfa * s + c)
% based on output of tf2zp function:
% G(s) = 1e-3 / ((s + 0.2500 - 0.5809i)(s + 0.2500 + 0.5809i))


% for current parameters we can observe step response of dynamic system for
% system without oscillations by
% step(numerator, denominator);

% if we want to see step response for system with oscillations we have to
% chenge parameters so that 
% xi = damperConst / (2 * sqrt(springConst * massConst)); < 1
% so lets

damperConstAttenulated = damperConst * 10;
springConstAttenulated = springConst;
massConstAttenulated = massConst;
forceConstAttenulated = forceConst;

numeratorAtt = [0 0 1];
denominatorAtt = [massConstAttenulated damperConstAttenulated springConstAttenulated];

% step(numeratorAtt, denominatorAtt);

