using StatsBase, Distributions, Plots

function roulette_spins(r, p)
	x=0
	wins=0
	while true
		x+=1
		if rand()<p
			wins+=1
			if wins==r
				return x
			end	
		end
	end
end

r,p,N=5, 18/37, 10^6
xgrid=r:r+15

mc_est=counts([roulette_spins(r,p) for _ in 1:N], xgrid)/N
nb_dist=NegativeBinomial(r, p)
nb_pmf=[pdf(nb_dist, x-r) for x in xgrid]

plot(xgrid, mc_est,
	line=:stem, marker=:circle, c=:blue,
	ms=10, msw=0, lw=4, label="MC estimate")
plot!(xgrid, nb_pmf, line=:stem,
	marker=:xcross, c=:red, ms=6, msw=0, lw=2, label="PMF",
	xlims=(0, maximum(xgrid)), ylims=(0, 0.2),
	xlabel="x", ylabel="Probability")
