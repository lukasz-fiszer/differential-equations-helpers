addpath('../');

% Plotting only direction field
[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y)

% Plotting with an explicit function
[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y, @(x) 0.25*e.^((x.^2)./2))

% Plotting with more than one explicit function
[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y, 
	{@(x) 0.25*e.^((x.^2)./2), @(x) e.^((x.^2)./2), @(x) (-1)*e.^((x.^2)./2), @(x) (-0.25)*e.^((x.^2)./2), @(x) 0*e.^((x.^2)./2)})

% Plotting and saving figure to a file
% this code saves the created figure to a file called arcsinh-de.pdf 
[quiv, fig] = plotDirectionFieldAndFunction([-2 0.2 2], [-2 0.2 2], @(x, y) 1./sqrt(1+x.^2), 
	{@asinh, @(x) asinh(x)+1}, 'arcsinh-de.pdf')