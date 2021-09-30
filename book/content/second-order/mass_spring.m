function dzdt = mass_spring(t, z)
    omega = 1;
    dzdt = zeros(2,1);
    
    dzdt(1) = z(2);
    dzdt(2) = 10*sin(omega*t) - 6*z(1) - 5*z(2);
end