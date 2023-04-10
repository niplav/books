using StatsBase, Distributions, Plots

lambda, N=1, 10^6
xgrid=0:6

expdist=Exponential(1/lambda)
floor_data=counts(convert.(Int, floor.(rand(expdist, N))), xgrid)/N
geom_dist=Geometric(1-MathConstants.e^-lambda)

plot(xgrid, floor_data,
	line=:stem, marker=:circle,
	c=:blue, ms=10, msw=0, lw=4,
	label="Floor of Exponential")
plot(xgrid, pdf.(geom_dist, xgrid),
	line=:stem, marker=:xcross,
	c=:red, ms=6, msw=0, lw=2,
	label="Geometric", ylims=(0, 1),
	xlabel="x", ylabel="Probability")
