using StatsBase, Distributions, Plots

function prn(lambda)
	k, p=0,1
	while p>MathConstants.e^(-lambda)
		k+=1
		p*=rand()
	end
	return k-1
end

xgrid, lambda, N=0:16, 5.5, 10^6

pdist=Poisson(lambda)
bpmf=pdf.(pdist, xgrid)
data=counts([prn(lambda) for _ in 1:N], xgrid)/N

plot(xgrid, data,
	line=:stem, ms=10, msw=0, lw=4, label="MC estimate")
plot(xgrid, bpmf, line=:stem,
	marker=:xcross, c=:red, ms=6, msw=0, lw=2, label="PMF",
	ylims=(0, 0.5), xlabel="x", ylabel="Probability of x events")
