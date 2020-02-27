function dxdt = masses(t, x)
% this is a function file to calculate the derivatives associated with the system

m1 = 40;
m2 = 40;
k = 200;

dxdt = zeros(4,1);

dxdt(1) = x(2);
dxdt(2) = (k/m1)*(-2*x(1) + x(3));
dxdt(3) = x(4);
dxdt(4) = (k/m2)*(x(1) - 2*x(3));