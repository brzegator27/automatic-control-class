% given:
% G(s) = (3s + 1) / (s(s + 1)(s + 3)) =
%       = (3(s + 1/3)) / (s(s + 1)(s + 3))
% we have three poles:
p_1 = 0;
p_2 = -1;
p_3 = -3;

% one zero:
z_1 = -1/3;

% and gain equal to:
k = 3; 

[numenator denominator] = zp2tf(z_1, [p_1 p_2 p_3], k); 
                            % transfer function polynomials from the zeros, 
                            % poles, and gains of a system in factored form.
                            % More about this function on 
                            % http://uk.mathworks.com/help/signal/ref/zp2tf.html

printsys(numerator, denominator); 
                            % output:
                            % num/den = 
%                                    1
%                            -----------------
%                            s^3 + 4 s^2 + 3 s

object = zpk(z_1, [p_1 p_2 p_3], k);
                            % object writen in console is:
                            % Zero/pole/gain:
%                             3 (s+0.3333)
%                             -------------
%                             s (s+1) (s+3)


% now we are given:
% G(s) = (4s + 1) / (s(0.2s + 1)(10s + 1))
%       = (2(s + 1/4)) / (s(s + 5)(1s + 1/10))

object_2 = zpk(-1/4, [0 -5 1/10], 2);
object_2




