using Distributions, Plots, LaTeXStrings

alphas=[0.5, 1.5, 1]
lam=2

lambda(dist::Weibull)=shape(dist)*scale(dist)^(-shape(dist))
theta(lam, alpha)=(alpha/lam)^(1/alpha)

dists=[Weibull.(a, theta(lam, a)) for a in alphas]

ha(dist, x)=pdf(dist,x)/ccdf(dist,x)
hb(dist, x)=lambda(dist)*x^(shape(dist)-1)

xgrid=0.01:0.01:10
hazards_a=[ha.(d,xgrid) for d in dists]
hazards_b=[hb.(d,xgrid) for d in dists]

println("Maximum difference between two implementations of hazard: ",
	maximum(maximum.(hazards_a-hazards_b)))

cl=[:blue :red :green]
lb=[L"\lambda="*string(lambda(d))*",    " * L"\alpha ="*string(shape(d))
	for d in dists]

plot(xgrid, hazards_a, c=cl, label=reshape(lb, 1,:), xlabel="x",
	ylabel="Instantaneous failure rate", xlims=(0, 10), ylims=(0, 10))
