# Differential equations helpers

A collection of helper functions/scripts/procedures related to differential equations

#### Plot direction field and a function

This MATLAB/OCTAVE function is used for plotting direction field and explicit functions on the same graph. It is a particularly handy procedure for checking a solution to a first order differential equation by graphically checking if proposed solutions align with slope vectors. See `plotDirectionFieldAndFunction.m` for further documentation.

Usage:

```matlab
% Plotting only direction field
[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y)
```
![Direction field usage 1](docs/sf1.svg)

```matlab
% Plotting with an explicit function
[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y, @(x) 0.25*exp((x.^2)./2))
```
![Direction field usage 2](docs/sf2.svg)

```matlab
% Plotting with more than one explicit function
[quiv, fig] = plotDirectionFieldAndFunction([-1 0.1 2], [-1 0.1 1], @(x, y) x.*y, 
    {@(x) 0.25*exp((x.^2)./2), @(x) exp((x.^2)./2), @(x) (-1)*exp((x.^2)./2), @(x) (-0.25)*exp((x.^2)./2), @(x) 0*exp((x.^2)./2)})
```
![Direction field usage 3](docs/sf3.svg)

```matlab
% Plotting and saving figure to a file
% this code saves the created figure to a file called arcsinh-de.pdf 
[quiv, fig] = plotDirectionFieldAndFunction([-2 0.2 2], [-2 0.2 2], @(x, y) 1./sqrt(1+x.^2), 
    {@asinh, @(x) asinh(x)+1}, 'arcsinh-de.pdf')
```
![Direction field usage 4](docs/sf4.svg)

#### Euler method

The MATLAB/OCTAVE eulerMethod() function implements forward Euler method. The function arguments are the vector of x values, initial y(x_0) = y_0 value and the y derivative y' = f(x, y). See `eulerMethod.m` for further documentation.

Usage:

```matlab
% approximate y(x) with Euler method
x = 0:0.01:2;
y = eulerMethod(x, 1, @(x, y) exp(x));
% plot with exact solution
plot(x, y);
hold on;
plot(x, exp(x));
```

