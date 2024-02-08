using Random, Distributions, KernelDensity, Plots
Random.seed!(0)

mu1, sigma1=10, 5
mu2, sigma2=40, 12

dist1, dist2=Normal(mu1, sigma1), Normal(mu2, sigma2)
p=0.3
mix_rv()=(rand() <= p) ? rand(dist1) : rand(dist2)
mix_pdf(x)=p*pdf(dist1, x)+(1-p)*pdf(dist2, x)

n=2000
data=[mix_rv() for _ in 1:n]

kde_dist=kde(data)

x_grid=-20:0.1:80
pdf_kde=pdf(kde_dist, x_grid)

plot(x_grid, pdf_kde, c=:blue, label="KDE PDF")
stephist!(data, bins=50, c=:black, normed=:true, label="Histogram")
p1=plot!(x_grid, mix_pdf.(x_grid), c=:red, label="Underlying PDF",
	xlims=(-20, 80), ylims=(0, 0.035), legend=:topleft,
	xlabel="X", ylabel="Density")

hvals=[0.5, 2, 10]
kdes=[kde(data, bandwidth=h) for h in hvals]

plot(x_grid, pdf(kdes[1], x_grid), c=:green, label="h=$(hvals[1])")
plot!(x_grid, pdf(kdes[2], x_grid), c=:blue, label="h=$(hvals[2])")
p2=plot!(x_grid, pdf(kdes[3], x_grid), c=:purple, label="h=$(hvals[3])",
	xlims=(-20, 80), ylims=(0, 0.035), legend=:topleft,
	xlabel="X", ylabel="Density")
plot(p1, p2, size=(800, 400))
