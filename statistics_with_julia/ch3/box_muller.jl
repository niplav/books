using Random, Distributions, Plots
Random.seed!(1)

Z()=sqrt(-2*log(rand()))*cos(2*pi*rand())
xgrid=-4:0.01:4

histogram([Z() for _ in 1:10^6], bins=50,
	normed=true, label="MC estimate")
plot(xgrid, pdf.(Normal(), xgrid),
	c=:red, lw=4, label="PDF",
	xlims=(-4, 4), ylims=(0,0.5), xlabel="x", ylabel="f(x)")
