function [time, num] = heat_equation(h)

x = [0 : h : 1]; n = length(x);
y = [0 : h : 1]; m = length(y);

% The coefficient matrix A is now m*n by m*n, since that is the total number of points.
% The right-hand side vector b is m*n by 1.
A = zeros(m*n, m*n);
b = zeros(m*n, 1);

num = m*n; % number of points

tic;

u_left = 100;
u_right = 100;
u_bottom = 100;
u_top = 0;

for j = 1 : m
    for i = 1 : n
        % for convenience we calculate all the indices once
        kij = (j-1)*n + i;
        kim1j = (j-1)*n + i - 1;
        kip1j = (j-1)*n + i + 1;
        kijm1 = (j-2)*n + i;
        kijp1 = j*n + i;
        
        if i == 1 
            % this is the left boundary
            A(kij, kij) = 1;
            b(kij) = u_left;
        elseif i == n 
            % right boundary
            A(kij, kij) = 1;
            b(kij) = u_right;
        elseif j == 1 
            % bottom boundary
            A(kij, kij) = 1;
            b(kij) = u_bottom;
        elseif j == m 
            % top boundary
            A(kij, kij) = 1;
            b(kij) = u_top;
        else
            % these are the coefficients for the interior points,
            % based on the recursion formula
            A(kij, kim1j) = 1;
            A(kij, kip1j) = 1;
            A(kij, kijm1) = 1;
            A(kij, kijp1) = 1;
            A(kij, kij) = -4;
        end
    end
end
u = A \ b;

u_square = reshape(u, [n, m]);
% the "20" indicates the number of levels for the contour plot
%contourf(x, y, u_square', 20);
%c = colorbar;
%c.Label.String = 'Temperature';

time = toc;