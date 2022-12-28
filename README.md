# Ridge FBA

Ridge FBA is a member of COBRA analyses family. It returns a unique flux distribution which is also more consistent with the actual values comparing to the similar methods.


## Formulation
Ridge FBA solves the following quadratic programming to find a context-specific objective function:



*Minimize:*


$$cv - 𝑹∗\parallel v \parallel_2$$

*Subject to:*

$$Sv=0$$

$$v_j \geq 0 \quad \forall j \in I$$
 
Where R is regularization coefficient, v is flux vector, S is stoichiometric matrix and I is the set of irreversible reactions. 

## Prerequisites
`RidgeFBA` reads SBML models by [SBML.jl](https://github.com/LCSB-BioCore/SBML.jl), models the optimization problem by [JuMP.jl](https://github.com/jump-dev/JuMP.jl) and uses [Ipopt.jl](https://github.com/jump-dev/Ipopt.jl) as the solver. 

So these three packages are required to run `RidgeFBA`, in addition [HTTP.jl](https://github.com/JuliaWeb/HTTP.jl) and [Test.jl](https://github.com/JuliaLang/julia/blob/master/stdlib/Test/src/Test.jl) are needed to run the test script for this function. 
They can be installed as the following example:
```
using Pkg
Pkg.add("JuMP")
```

## Usage
This function can be called simply, by a single line of code:
```
flux_vector=RidgeFBA(metabolic_model,c,lambda)
```

 #### Input:
  **metabolic model**: Metabolic models contain stoichiometric matrix above all, and also other informations such as flux boundaries and Gene-Protein-Reaction rules. They can be found in different formats including .xml. Metabolic models can be downloaded from [BiGG Models](http://bigg.ucsd.edu/) or elsewhere.
  
  **c**: A vector with the same length as the metabolic model reactions, determining the objective function.
  For example, if biomass is meant to be the objective function, the corresponding element in c vector is set to 1 and the others are zero. 
  
  **lambda**: Regularization coefficient for the L2 norm term in the objective function of the optimization problem. The larger lambda, the smaller the flux vector.
  
 #### Output:
  **flux_vector**: It is the calculated flux distribution, which is of type Vector{Float64} (a vector whose elements are Float64), So this can be indexed and used like any other vector. 
  
