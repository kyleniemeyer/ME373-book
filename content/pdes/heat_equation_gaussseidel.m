function [time, num_point, num_iter] = heat_equation_gaussseidel(h)

x = [0 : h : 1]; n = length(x);
y = [0 : h : 1]; m = length(y);

% The coefficient matrix A is now m*n by m*n, since that is the total number of points.
% The right-hand side vector b is m*n by 1.
A = zeros(m*n, m*n);
b = zeros(m*n, 1);
num_point = m*n;

tic;

u_left = 100;
u_right = 100;
u_bottom = 100;
u_top = 0;

% initial guess
u = 100*ones(m*n, 1);

% dummy value for residual variable
epsilon = 1.0; 

num_iter = 0;
while epsilon > 1e-6
    u_old = u;
    
    epsilon = 0;
    for j = 1 : m
        for i = 1 : n
            kij = (j-1)*n + i;
            kim1j = (j-1)*n + i - 1;
            kip1j = (j-1)*n + i + 1;
            kijm1 = (j-2)*n + i;
            kijp1 = j*n + i;

            if i == 1 
                % this is the left boundary
                u(kij) = u_left;
            elseif i == n 
                % right boundary
                u(kij) = u_right;
            elseif j == 1 
                % bottom boundary
                u(kij) = u_bottom;
            elseif j == m 
                % top boundary
                u(kij) = u_top;
            else
                % interior points
                u(kij) = (u(kip1j) + u(kim1j) + u(kijm1) + u(kijp1))/4.0;
            end
        end
    end
    
    epsilon = max(abs(u - u_old));
    num_iter = num_iter + 1;
end

u_square = reshape(u, [n, m]);
%% the "20" indicates the number of levels for the contour plot
contourf(x, y, u_square', 20);
c = colorbar;
c.Label.String = 'Temperature';

time = toc;
fprintf('Number of iterations: %d\n', num_iter)