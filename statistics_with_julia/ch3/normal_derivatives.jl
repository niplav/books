using Distributions, Calculus, SpecialFunctions, Plots

xgrid=-5:0.01:5

phi_a(x)=0.5*(1+erf(x/sqrt(2)))
phi_b(x)=cdf(Normal(),x)

println("Maximum difference between two CDF implementations: ",
	maximum(phi_a.(xgrid)-phi_b.(xgrid)))

normal_density(z)=pdf(Normal(), z)

d0=normal_density.(xgrid)
d1=derivative.(normal_density, xgrid)
d2=second_derivative.(normal_density, xgrid)

plot(xgrid, [d0 d1 d2], c=[:blue :red :green], label=["f(x)" "f'(x)" "f''(x)"])
plot!([-5, 5], [0,0], color=:black, lw=0.5, xlabel="x", xlims=(-5, 5), label="")
