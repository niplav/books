using Distributions, Plots

L, K, n=500, [450, 400, 250, 100, 50], 30
hyper_dists=[Hypergeometric(k, L-k, n) for k in K]
xgrid=0:1:n
pmfs=[pdf.(dist,xgrid) for dist in hyper_dists]
labels="Successes=".*string.(K)

bar(xgrid, pmfs,
	alpha=0.8, c=[:orange :purple :green :red :blue],
	label=hcat(labels...), ylims=(0, 0.25),
	xlabel="x", ylabel="Probability", legend=:top)
