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
This function. and returns the predicted flux vector

V=Ridge_FBA(ecoli_metabolic_model,c_test,10^-5)
