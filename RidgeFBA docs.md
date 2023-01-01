`RidgeFBA` is a member of COBRA analyses family. It returns a unique flux distribution which is also more consistent with the actual values comparing to the similar methods. For the complete tutorial see [here](https://github.com/opencobra/COBRA.jl/tree/master/tutorials)


This function can be called simply, by a single line of code:

using COBRA
flux_vector=RidgeFBA(metabolic_model,c,lambda)

 #### Input:
  **metabolic model**: The Metabolic model in .xml format.
  
  
  **c**: A vector with the same length as the metabolic model reactions, determining the objective function.
  
  
  **lambda**: Regularization coefficient for the L2 norm.
  
 #### Output:
  **flux_vector**: The calculated flux distribution. 
  

