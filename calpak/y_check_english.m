function ierror = y_check_english ( y )

%*****************************************************************************80
%
%% Y_CHECK_ENGLISH checks an English year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year, which must not be 0.
%
%    Output, integer IERROR, is 0 if Y is legal, and 1 otherwise.
%
  if ( y ~= 0 )
    ierror = 0;
  else
    ierror = 1;
  end

  return
end