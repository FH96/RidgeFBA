# Ridge-FBA

Ridge FBA is a variant of COBRA analyses.

Ridge FBA read SBML models by SBML.jl, models the optimization problem by JuMP.jl and uses Ipopt.jl as the solver. 

So these three packages are required to run ridge FBA, in addition HTTP.jl and Test.jl are needed to run the test script for this function. 

This function.. and returns the predicted flux vector

V=Ridge_FBA()
