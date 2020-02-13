function dydx = shooting_rhs(x, y)

dydx = zeros(2,1);
dydx(1) = y(2);
dydx(2) = 2*x - x*y(2) + x*y(1);