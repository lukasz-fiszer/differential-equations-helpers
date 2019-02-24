% Euler method
% Used for initial value problems
% with first order differential equations of the form
% y' = f(x, y)
% y(x_0) = y_0
% 
% The forward Euler method is an explicit numerical method
% that iteratively approximates y(x) for a discrete sequence of x values
% y(x_i) = y(x_{i-1}) + (x_i - x_{i-1}) * f(x_{i-1}, y(x_{i-1}))
% 
% Inputs:
% 	x: the range of x values, a sequence x_n
% 	y_0: the value of y for first x in the sequence x_n, y_0 = y(x_0)
% 		obtained from initial condition (IC) of the initial value problem (IVP)
% 	yderivative: is the function y' = f(x, y) 
% 		used to obtain tangent lines to approximate y(x)
% 
% Return values:
% 	y: the approximation of y(x) for given vector of x values
% 
% Note, yderivative is used only with scalar arguments (ie, the vector of inputs one by one),
% so it does not have to distinguish between matrix and element-wise operations
% 
% Usage:
% 	y = eulerMethod(0:0.01:2, 1, @(x, y) exp(x))
% 	y = eulerMethod(x, 1, @(x, y) x^4 + 2*x - x^2*y);
% 	
% Author: Łukasz Fiszer
% 	

function y = eulerMethod(x, y_0, yderivative)	
	% prepare vector of y(x) values
	y = x;
	y(1) = y_0;

	% iterate over the sequence of x values approximating y(x)
	for i = 2:length(x)
		y(i) = y(i-1) + (x(i) - x(i-1)) * yderivative(x(i-1), y(i-1));
	end

end
