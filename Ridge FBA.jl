using JuMP, Ipopt , COBREXA


function Ridge_FBA(metabolic_model,C,lambda)
    
    irreversible_indices=[]
    for i in 1:size(reactions(metabolic_model),1)
        if bounds(metabolic_model)[1][i]==0
            push!(irreversible_indices,i)
        end    
    end
    s_matrix=stoichiometry(metabolic_model)

    model=JuMP.Model(with_optimizer(Ipopt.Optimizer,hessian_constant="yes",max_iter=1000))


    @variable(model,-1000<=v[1:size(reactions(metabolic_model),1)]<=1000)       
    
    @constraint(model,[j in irreversible_indices],0<=v[j]<=1000) #+                                           #for v ++
    
    @constraint(model, s_matrix*v.==0)
   

    nonzero=findall(x->x!=0,C)
    n_selected=size(nonzero,1)

    @objective(model,Max,sum(C[i]*v[i] for i in 1:size(v,1) ) - (n_selected/size(reactions(metabolic_model),1))*lambda*sum(v[e]^2 for e in 1:size(v,1)))



    for i in 1:size(v,1)
        if i in irreversible_indices
            set_start_value(v[i],rand(0:0.01:1000))
        else
            set_start_value(v[i],rand(-1000:0.01:1000))
        end
    end
    JuMP.optimize!(model)


    return JuMP.value.(v)
end




