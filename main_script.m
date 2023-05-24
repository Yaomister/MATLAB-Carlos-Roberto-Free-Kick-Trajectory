% initial position and velocity of the ball
x0 = [0; 0; 0; 4.581; 37.307; 13.681;];

% only track the motion between 0s and 1.5s
tspan = [0 1.5];

% use ode45
[t, x] = ode45(@soccer_ball, tspan, x0);

% getting the positison vectors
x_pos = x(:, 1);
y_pos = x(:, 3);
z_pos = x(:, 2);

% making the 3d graphs
figure;
plot3(x_pos * 1.25, z_pos, y_pos/7);
xlabel('X');
ylabel('Z');
zlabel('Y');
grid on;


% making the 2d graphs
figure;
plot(z_pos, x_pos * 1.25);
xlabel('z');
ylabel('x');
grid on;

% making the 2d graphs
figure;
plot(y_pos/7, x_pos);
xlabel('y');
ylabel('x');
grid on;