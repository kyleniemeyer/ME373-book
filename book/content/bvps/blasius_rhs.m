function dydx = blasius_rhs(eta, y)

dydx = zeros(3,1);

dydx(1) = y(2);
dydx(2) = y(3);
dydx(3) = -y(1) * y(3);