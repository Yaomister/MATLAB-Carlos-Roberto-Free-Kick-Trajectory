function dxdt = soccer_ball(t, x)
    % define the cosntants
    cd = 0.15;
    A = 3.1415926 * 0.11^2;
    m = 0.442;
    g = 9.81;
    p = 1.225;
    
    % getting the variables
    x_val = x(1);
    y_val = x(2);
    z_val = x(3);
    vx = x(4);
    vy = x(5);
    vz = x(6);
    
    % solve velocity magnitude
    v = norm([vx, vy, vz]);

    % solve the angular acceleration and lift coefficient
    aa = 88* exp(-t/7); % use exponential decay model to simulate how the ball loses spin
    cl = (0.11 * aa)/40; % make the lift coefficient as a function of angular acceleration
    
    % devide the second order derivatives into first order derivatives
    dxdt = vx;
    dydt = vy;
    dzdt = vz;
    dvxdt = -abs(v) *  ((p*A)/(2 * m))  * (cd * vx + cl * vz);
    dvydt = -abs(v) *  ((p*A)/(2 * m)) * (cd * vy) - g;
    dvzdt = -abs(v) * ((p*A)/(2 * m)) * (cd * vz - cl * vx);
    
    % return the derivatives as a column vector
    dxdt = [dxdt; dydt; dzdt; dvxdt; dvydt; dvzdt];
end