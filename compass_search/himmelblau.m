function f = himmelblau ( m, x )

%*****************************************************************************80
%
%% HIMMELBLAU computes the Himmelblau function.
%
%  Discussion:
%
%    This function has 4 global minima:
%
%      X* = (  3,        2       ), F(X*) = 0.
%      X* = (  3.58439, -1.84813 ), F(X*) = 0.
%      X* = ( -3.77934, -3.28317 ), F(X*) = 0.
%      X* = ( -2.80512,  3.13134 ), F(X*) = 0.
%
%    Suggested starting points are
%
%      (+1,+1),
%      (-1,+1),
%      (-1,-1),
%      (+1,-1),
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Himmelblau,
%    Applied Nonlinear Programming,
%    McGraw Hill, 1972,
%    ISBN13: 978-0070289215,
%    LC: T57.8.H55.
%
%  Parameters:
%
%    Input, integer M, the number of variables.
%
%    Input, real X(M), the argument of the function.
%
%    Output, real F, the value of the function at X.
%
  f = ( x(1)^2 + x(2)   - 11.0 )^2 ...
    + ( x(1)   + x(2)^2 -  7.0 )^2;
 
  return
end
