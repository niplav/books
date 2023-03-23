using Plots, LaTeXStrings

xgrid=0:0.01:10
ugrid=0:0.01:1
busy=0.8

F(t)=t<=0 ? 0 : 1 - busy*exp(-(1-busy)t)

infimum(B)=isempty(B) ? Inf : minimum(B)
invF(u)=infimum(filter((x)->(F(x)>=u), xgrid))

p1=plot(xgrid, F.(xgrid), c=:blue, xlims=(-0.1, 10), ylims=(0,1),
	xlabel=L"x", ylabel=L"F(x)")
p2=plot(ugrid, invF.(ugrid), c=:blue, xlims=(0, 0.95), ylims=(0, maximum(xgrid)),
	xlabel=L"u", ylabel=L"=^{-1}(u)")

plot(p1, p2, legend=:none, size=(800, 400))
