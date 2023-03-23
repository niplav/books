using Distributions, Plots, LaTeXStrings

dist=TriangularDist(0, 2, 1)
xgrid=0:0.01:2
ugrid=0:0.01:1

p1=plot(xgrid, pdf.(dist, xgrid), c=:blue,
	xlims=(0,2), ylims=(0, 1.1),
	xlabel="x", ylabel="f(x)")
p2=plot(xgrid, cdf.(dist, xgrid), c=:blue,
	xlims=(0,2), ylims=(0, 1),
	xlabel="x", ylabel="F(x)")
p3=plot(ugrid, quantile.(dist, ugrid), c=:blue,
	xlims=(0,1), ylims=(0, 2),
	xlabel="x", ylabel=(L"F^{-1}(u)"))

plot(p1, p2, p3, legend=:false, layout=(1, 3), size=(1200, 400))
