using JuMP, Ipopt
using Random
using COBREXA
using HTTP
using Test


ecoli_model=HTTP.get("http://bigg.ucsd.edu/static/models/e_coli_core.xml")
write("e_coli_core.xml",ecoli_model.body)
ecoli_metabolic_model=load_model("e_coli_core.xml")


for n in 1:length(reactions(ecoli_metabolic_model))
    #println(n)
    if occursin("BIOMASS" , reactions(ecoli_metabolic_model)[n])
        global biomass_index=n
    end
end


c_test=zeros(1,length(reactions(ecoli_metabolic_model)))

c_test[biomass_index]=1




flux_vector=Ridge_FBA(ecoli_metabolic_model,c_test,10^-5)                                                          

                                                           
@test isapprox(flux_vector[biomass_index] ,46.17244338638067; atol=0.001)

