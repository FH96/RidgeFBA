# Ridge-FBA

Ridge FBA is a member of COBRA analyses family.

Ridge FBA reads SBML models by [SBML.jl](https://github.com/LCSB-BioCore/SBML.jl), models the optimization problem by [JuMP.jl](https://github.com/jump-dev/JuMP.jl) and uses [Ipopt.jl](https://github.com/jump-dev/Ipopt.jl) as the solver. 

So these three packages are required to run ridge FBA, in addition HTTP.jl and Test.jl are needed to run the test script for this function. 
They can be installed :
```
using Pkg
Pkg.add("JuMP")
```
This function.. and returns the predicted flux vector

V=Ridge_FBA(ecoli_metabolic_model,c_test,10^-5)
