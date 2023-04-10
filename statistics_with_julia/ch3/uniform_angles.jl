using Distributions, Plots, LaTeXStrings

cunif=Uniform(0, 2π)
xgrid, N=0:0.1:2π, 10^6

stephist(rand(N)*2π, bins=xgrid,
	normed=:true, c=:blue,
	label="MC Estimate")

plot(xgrid, pdf.(cunif, xgrid),
	c=:red, ylims=(0, 0.5), xlabel="PDF", ylabel="Density", xticks=(0:π/2:2π))
