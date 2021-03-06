function node_xyz = sphere_grid_t3_node_xyz ( nelemx, nelemy )

%*****************************************************************************80
%
%% SPHERE_GRID_T3_NODE_XYZ produces node coordinates for a T3 sphere grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NELEMX, NELEMY, the number of elements along the
%    X and Y directions. 
%
%    Output, real NODE_XYZ(3,NELEMX*(NELEMY-1)+2), 
%    the node coordinates.
%
  node = 0;

  node = node + 1;  
  node_xyz(1,node) =  0.0;
  node_xyz(2,node) =  0.0;
  node_xyz(3,node) = -1.0;

  for j = nelemy : -1 : 2

    phi = ( j - 1 ) * pi / nelemy;

    for i = 1 : nelemx

      theta = ( i - 1 ) * 2.0 * pi / nelemx;

      node = node + 1;
      node_xyz(1,node) = cos ( theta ) * sin ( phi );
      node_xyz(2,node) = sin ( theta ) * sin ( phi );
      node_xyz(3,node) =                 cos ( phi );

    end
  end

  node = node + 1;
  node_xyz(1,node) =  0.0;
  node_xyz(2,node) =  0.0;
  node_xyz(3,node) =  1.0;

  return
end
