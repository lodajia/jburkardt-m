function [ x, w ] = rule11 ( n )

%*****************************************************************************80
%
%% RULE11 returns the rule of degree 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer N, the number of nodes.
%
%    Output, real X(2,N), the coordinates of the nodes.
%
%    Output, real W(N), the weights.
%
  xs = [ ...
    0.1885861387186414,0.9535395282015320, ...
    -.1885861387186413,-.9535395282015320, ...
    -.6980761045495679,0.9826392235408555, ...
    0.6980761045495681,-.9826392235408555, ...
    -.9394863828167370,0.8257758359029639, ...
    0.9394863828167370,-.8257758359029637, ...
    -.7120019130753364,0.5253202503645475, ...
    0.7120019130753364,-.5253202503645475, ...
    -.3156234329152547,0.8125205483048131, ...
    0.3156234329152548,-.8125205483048131, ...
    -.4248472488486694,0.4165807191202203E-01, ...
    0.4248472488486694,-.4165807191202197E-01 ];
  ys = [ ...
    -.9535395282015320,0.1885861387186414, ...
    0.9535395282015320,-.1885861387186413, ...
    -.9826392235408555,-.6980761045495680, ...
    0.9826392235408555,0.6980761045495683, ...
    -.8257758359029640,-.9394863828167370, ...
    0.8257758359029638,0.9394863828167370, ...
    -.5253202503645475,-.7120019130753364, ...
    0.5253202503645475,0.7120019130753364, ...
    -.8125205483048131,-.3156234329152547, ...
    0.8125205483048131,0.3156234329152549, ...
    -.4165807191202205E-01,-.4248472488486694, ...
    0.4165807191202200E-01,0.4248472488486694/
  ws = [ ...
    0.6886285066821880E-01,0.6886285066821880E-01, ...
    0.6886285066821880E-01,0.6886285066821880E-01, ...
    0.3395580740305121E-01,0.3395580740305121E-01, ...
    0.3395580740305121E-01,0.3395580740305121E-01, ...
    0.4671948489426224E-01,0.4671948489426224E-01, ...
    0.4671948489426224E-01,0.4671948489426224E-01, ...
    0.1595417182608939,0.1595417182608939, ...
    0.1595417182608939,0.1595417182608939, ...
    0.1497202089079448,0.1497202089079448, ...
    0.1497202089079448,0.1497202089079448, ...
    0.2483067110521767,0.2483067110521767, ...
    0.2483067110521767,0.2483067110521767 ];

  x(1,1:n) = xs(1:n);
  x(2,1:n) = ys(1:n);
  w(1:n) = ws(1:n);

  return
end