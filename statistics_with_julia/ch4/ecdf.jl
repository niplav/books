using Random, Distributions, StatsBase, Plots
Random.seed!(0)

mu1, sigma1=10, 5
mu2, sigma2=40, 12
dist1, dist2=Normal(mu1, sigma1), Normal(mu2, sigma2)
p=0.3
mix_rv()=(rand()<=p) ? rand(dist1) : rand(dist2)
mix_cdf(x)=p*cdf(dist1, x)+(1-p)*cdf(dist2, x)

n=[30, 100]
data1=[mix_rv() for _ in 1:n[1]]
data2=[mix_rv() for _ in 1:n[2]]

empirical_cdf1=ecdf(data1)
empirical_cdf2=ecdf(data2)

x_grid=-10:0.1:80
plot(x_grid, empirical_cdf1.(x_grid), c=:blue, label="ECDF with $(n[1])")
plot!(x_grid, empirical_cdf2.(x_grid), c=:red, label="ECDF with $(n[2])")
plot!(x_grid, mix_cdf.(x_grid), c=:black, label="Underlaying CDF",
	xlims=(-10, 80), ylims=(0, 1),
	xlabel="x", ylabel="Probability", legend=:topleft)
