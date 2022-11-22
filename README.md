# Ridge-FBA

Ridge FBA is a member of COBRA analyses family. It returns a unique flux disrtibution which is also  more consistent with the actual values comparing to the similar methods

## Prerequisites
Ridge FBA reads SBML models by [SBML.jl](https://github.com/LCSB-BioCore/SBML.jl), models the optimization problem by [JuMP.jl](https://github.com/jump-dev/JuMP.jl) and uses [Ipopt.jl](https://github.com/jump-dev/Ipopt.jl) as the solver. 

So these three packages are required to run ridge FBA, in addition [HTTP.jl](https://github.com/JuliaWeb/HTTP.jl) and [Test.jl](https://github.com/JuliaLang/julia/blob/master/stdlib/Test/src/Test.jl) are needed to run the test script for this function. 
They can be installed as the following example:
```
using Pkg
Pkg.add("JuMP")
```

## Usage
This function can be called 

flux_vector=Ridge_FBA(metabolic_model,c,lambda)

 ######Input:
  metabolic model (.xml), can be downloaded from [BiGG Models](http://bigg.ucsd.edu/) or elsewhere.
  
  c:a vector with the same length as the metabolic model reactions,determining the objective function
  For example,if biomass is meant to be the objective function, the corresponding element in in c vector is set to 1 and the others are zero 
  
  lambda: regularization coefficient for the L2 norm term in. The larger lambda is, the smaller the flux vector will be.
  
 ######Output:
  flux_vector: 
  
