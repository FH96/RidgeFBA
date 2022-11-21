#In this script the metabolic model 'e_coli_core' is  downloaded and by assumption of biomass as objective function,
#flux dixtribution is computed and the value for objective function is tested

using JuMP, Ipopt
using Random
using SBML
using HTTP
using Test

#Downloading the metabolic model
ecoli_model=HTTP.get("http://bigg.ucsd.edu/static/models/e_coli_core.xml")
write("e_coli_core.xml",ecoli_model.body)
ecoli_metabolic_model=readSBML("e_coli_core.xml")

#Obtaining the biomass reaction inedx
for n in 1:length(reactions(ecoli_metabolic_model))
    if occursin("BIOMASS" , reactions(ecoli_metabolic_model)[n])
        global biomass_index=n
    end
end


#As biomass is set as objective function the corresponding element in in c vector is set to 1
c_test=zeros(1,length(reactions(ecoli_metabolic_model)))
c_test[biomass_index]=1




flux_vector=Ridge_FBA(ecoli_metabolic_model,c_test,10^-5)                                                          

                                                           
@test isapprox(flux_vector[biomass_index] ,46.17244338638067; atol=0.001)

