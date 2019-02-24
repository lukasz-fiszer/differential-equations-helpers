addpath('../');

% approximate y(x) with Euler method
x = 0:0.01:2;
y = eulerMethod(x, 1, @(x, y) exp(x));
% plot with exact solution
plot(x, y);
hold on;
fig = plot(x, exp(x));

waitfor(fig);
clf;

x = 0.01:0.01:2*pi;
y = eulerMethod(x, 0, @(x, y) x*cos(x) + y/x);
plot(x, y); 
hold on;
plot(x, x.*sin(x) + 2*x);
fig = plot(x, x.*sin(x));

waitfor(fig);
clf;

x = 0:0.01:2;
y1 = eulerMethod(x, 0, @(x, y) x^4 + 2*x - x^2*y);
y2 = eulerMethod(x, 1, @(x, y) x^4 + 2*x - x^2*y);
plot(x, y1); 
hold on;
plot(x, y2);
plot(x, x.^2);
plot(x, exp(-x.^3/3)+x.^2);
legend('y1 exact', 'y2 exact', 'y1 approximation by Euler method', 'y2 approximation by Euler method')