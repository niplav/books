using StatsBase, Distributions, Plots

binomial_rv(n,p)=sum(rand(n).<p)

p,n,N=0.5, 10, 10^6

bdist=Binomial(n, p)
xgrid=0:n
bpmf=[pdf(bdist, i) for i in xgrid]
data=[binomial_rv(n, p) for _ in 1:N]
pmf_est=counts(data, 0:n)/N

plot(xgrid, pmf_est, line=:stem, marker=:circle, c=:blue, ms=10, msw=0, lw=4,
	label="MC estimate")
plot(xgrid, bpmf, line=:stem, marker=:xcross, c=:red, ms=6, msw=0, lw=2,
	label="PMF", xticks=(0:1:10), ylims=(0, 0.3), xlabel="x", ylabel="Probability")
