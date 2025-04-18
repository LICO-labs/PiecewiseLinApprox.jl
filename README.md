# PiecewiseLinApprox.jl
[![](https://img.shields.io/badge/docs-latest-blue.svg)](https://lico-labs.github.io/PiecewiseLinApprox.jl/) [![DOI](https://zenodo.org/badge/510425449.svg)](https://doi.org/10.5281/zenodo.14052031)


PiecewiseLinApprox.jl (formerly LinA.jl) is a state-of-the-art piecewise linear approximation package that approximates (or over/under-estimates) univariate differentiable $\mathbb{R} \rightarrow \mathbb{R}$ functions with an optimal (in terms of number of segments) piecewise linear function given an error metric.
Both absolute and relative errors are implemented. It is also possible to add custom error types. PiecewiseLinApprox works with expressions as well as with native Julia functions.
Details of the algorithms can be found in [this paper.](https://link.springer.com/article/10.1007/s12532-024-00274-8)

## Installation

To install PiecewiseLinApprox, first, enter Pkg mode by hitting `]`, and then run the following command:

```julia-repl
pkg> add https://github.com/LICO-labs/PiecewiseLinApprox.jl
```


## Usage of the PiecewiseLinApprox package

For the full documentation, see the [documentation webpage.](https://lico-labs.github.io/LinA.jl/) 
### Basic use
To linearize $f(x) = x^2$ from -10 to 10 with a maximum absolute error of $2$ simply do
```julia
julia> using PiecewiseLinApprox

julia> pwl = Linearize(:(x^2),-10,10,Absolute(2))
5-element Vector{PiecewiseLinApprox.LinearPiece}:
 -16.000000000000004 x -62.00000000000003 from -10.0 to -6.0
 -8.0 x -14.0 from -6.0 to -2.0
 0.0 x + 2.0 from -2.0 to 2.0
 8.0 x -14.0 from 2.0 to 5.999999999999999
 15.999999999999996 x -61.99999999999998 from 5.999999999999999 to 10.0

```
**Note:** By default, PiecewiseLinApprox uses the hybrid heuristic algorithm. To use the (slightly slower) exact algorithm, simply add `ExactLin()` as an argument.

You can now call `pwl` as a Julia function such as

```julia
julia> pwl(2)
4.470129472588532
```
But also as an array to get the individual linear segments such as
```julia 
julia> pwl[2]
-8.0 x -14.0 from -6.0 to -2.0

julia> pwl[2].xMax
-2.0
```
### Plotting
Pwl functions are native Julia functions and are compatible with Plots.jl. To plot a pwl function simply do
```julia
using Plots

plot(x->pwl(x),-10,10)

```
![alt text](https://i.imgur.com/7IHj3qp.png)

## Citing

If you have used our library and wish to cite our work (which we greatly encourage) use the reference of [our paper.](https://link.springer.com/article/10.1007/s12532-024-00274-8) Starring the _PiecewiseLinApprox.jl_ repository on GitHub is also appreciated.
