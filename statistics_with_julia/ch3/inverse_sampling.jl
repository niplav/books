using Distributions, Plots

triang_dist=TriangularDist(0, 2, 1)
xgrid=0:0.1:2
N=10^6
inverse_sampled_data=quantile.(triang_dist, rand(N))

histogram(inverse_sampled_data, bins=30, normed=true,
	ylims=(0, 1.1), label="Inverse transform data")
plot!(xgrid, pdf.(triang_dist, xgrid), c=:red, lw=4, xlabel="x", label="PDF", ylabel="Density", legend=:topright)
