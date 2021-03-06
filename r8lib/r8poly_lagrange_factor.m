function [ wval, dwdx ] = r8poly_lagrange_factor ( npol, xpol, xval )

%*****************************************************************************80
%
%% R8POLY_LAGRANGE_FACTOR evaluates the polynomial Lagrange factor at a point.
%
%  Formula:
%
%    W(X) = Product ( 1 <= I <= NPOL ) ( X - XPOL(I) )
%
%  Discussion:
%
%    Suppose F(X) is at least N times continuously differentiable in the
%    interval [A,B].  Pick NPOL distinct points XPOL(I) in [A,B] and compute
%    the interpolating polynomial P(X) of order NPOL ( and degree NPOL-1)
%    which passes through all the points ( XPOL(I), F(XPOL(I)) ).
%    Then in the interval [A,B], the maximum error
%
%      abs ( F(X) - P(X) )
%
%    is bounded by:
%
%      C * FNMAX * W(X)
%
%    where
%
%      C is a constant,
%      FNMAX is the maximum value of the NPOL-th derivative of F in [A,B],
%      W(X) is the Lagrange factor.
%
%    Thus, the value of W(X) is useful as part of an estimated bound
%    for the interpolation error.
%
%    Note that the Chebyshev abscissas have the property that they minimize
%    the value of W(X) over the interval [A,B].  Hence, if the abscissas may
%    be chosen arbitrarily, the Chebyshev abscissas have this advantage over
%    other choices.
%
%    For a set of points XPOL(I), 1 <= I <= NPOL, the IPOL-th Lagrange basis
%    polynomial L(IPOL)(X), has the property:
%
%      L(IPOL)( XPOL(J) ) = delta ( IPOL, J )
%
%    and may be expressed as:
%
%      L(IPOL)(X) = W(X) / ( ( X - XPOL(IPOL) ) * W'(XPOL(IPOL)) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NPOL, the number of abscissas.
%    NPOL must be at least 1.
%
%    Input, real XPOL(NPOL), the abscissas, which should 
%    be distinct.
%
%    Input, real XVAL, the point at which the Lagrange 
%    factor is to be evaluated.
%
%    Output, real WVAL, the value of the Lagrange factor at XVAL.
%
%    Output, real DWDX, the derivative of W with respect to XVAL.
%
  wval = prod ( xval - xpol(1:npol) );

  dwdx = 0.0;

  for i = 1 : npol

    term = 1.0;

    for j = 1 : npol
      if ( i ~= j )
        term = term * ( xval - xpol(j) );
      end
    end

    dwdx = dwdx + term;

  end

  return
end
