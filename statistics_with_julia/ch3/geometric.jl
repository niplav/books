using StatsBase, Distributions, Plots

function roulette_spins(p)
	x=0
	while true
		x+=1
		if rand()<p
			return x
		end
	end
end

p, xgrid, N=18/37, 1:7, 10^6
mc_est=counts([roulette_spins(p) for _ in 1:N], xgrid)/N
gdist=Geometric(p)
g_pmf=[pdf(gdist, x-1) for x in xgrid]
plot(xgrid, mc_est, line=:stem, market=:circle, c=:blue, ms=10, msw=0, lw=4,
	label="MC estimate")
plot(xgrid, g_pmf, line=:stem, marker=:xcross, c=:red, ms=6, msw=0, lw=2, label="PMF",
	ylims=(0, 0.5), xlabel="x", ylabel="Probability")
