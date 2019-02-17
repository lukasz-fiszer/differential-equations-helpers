% Plot direction field and a function at one graph
% Used for first order differential equations of the form
% y' = f(x, y)
% The function is also useful to 
% graphically confirm a solution to a differential equation
% by plotting y(x) alongside its slope field
% 
% Inputs:
% 	range descriptors: vectors of length 3 of the form [min, step, max]
% 		used to describe the range of values for given variable
% 	xrange, yrange: range descriptors for x and y
% 	yderivative: is the function y' = f(x, y) used to obtain slope vectors
% 	yfunctions [optional]: a cell array of functions y(x) or a single function y(x), 
% 		these are given solutions of the differential equation to plot alongside slope field
% 	filename [optional]: a string filename used for saving the figure to a file
% 
% Return values:
% 	quiverobject: a Quiver object returned from calling quiver()
% 	fig: a Figure object of the plot created
% 
% Usage:
% 	[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y)
% 	[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y, @(x) 0.25*e.^((x.^2)./2))
% 	[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y, 
% 		{@(x) 0.25*e.^((x.^2)./2), @(x) e.^((x.^2)./2), @(x) (-1)*e.^((x.^2)./2), 
% 		@(x) (-0.25)*e.^((x.^2)./2), @(x) 0*e.^((x.^2)./2)})
% 	[quiv, fig] = plotDirectionFieldAndFunction([-2 0.2 2], [-2 0.2 2], @(x, y) 1./sqrt(1+x.^2), 
% 		{@asinh, @(x) asinh(x)+1}, 'arcsinh-de.pdf')
% 	
% Author: Łukasz Fiszer
% 	

function [quiverobject, fig] = plotDirectionFieldAndFunction(xrange, yrange, yderivative, yfunctions = {}, filename)
	% assert proper range descriptors
	assert(length(xrange(:)) == 3 && isnumeric(xrange), 
		'First argument (xrange) must be a vector of the form [min step max]');
	assert(length(yrange(:)) == 3 && isnumeric(yrange), 
		'Second argument (yrange) must be a vector of the form [min step max]');

	% generate meshgrid of (x, y) values
	xspace = xrange(1):xrange(2):xrange(3);
	yspace = yrange(1):yrange(2):yrange(3);
	[x, y] = meshgrid(xspace, yspace);
	
	% generate slope vectors
	dydx = yderivative(x, y);
	dy = xrange(2) * dydx;
	dx = dydx ./ dydx * xrange(2);
	
	% set plot range and plot x and y axes
	fig = figure();
	axis(1.1 * [xrange(1) xrange(3) yrange(1) yrange(3)]);
	hold on;
	line([0 0], ylim, 'color', 'k');
	line(xlim, [0 0], 'color', 'k');

	% plot direction field using quiver()	
	quiverobject = quiver(x, y, dx, dy, 'color', [0.2 0.2 1]);

	% plot function(s) y(x) explicitly
	% by default use 10 times more dense x values for plotting the function
	xfuncspace = xrange(1):xrange(2)/10:xrange(3);

	% if a single function was given directly, wrap it into a cell array
	if isa(yfunctions, 'function_handle')
		yfunctions = {yfunctions};
	endif

	% iterate over the functions and plot each
	for i = 1:length(yfunctions)
		func = yfunctions{i}
		plot(xfuncspace, func(xfuncspace), 'LineWidth', 1);
	end

	% if optional argument of filename was given, save a printed figure to a file
	if exist('filename')
		print(fig, filename)
	end

endfunction
