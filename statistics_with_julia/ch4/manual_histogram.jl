using Plots, Distributions, Random

Random.seed!(0)

n=2000
data=rand(Normal(), n)
l, m=minimum(data), maximum(data)

delta=0.3
bins=[(x, x+delta) for x in l:delta:m-delta]
if last(bins)[2]<m
	push!(bins, (last(bins)[2], m))
end
L=length(bins)

in_bin(x, j)=first(bins[j])<=x && x<last(bins[j])
size_bin(j)=last(bins[j])-first(bins[j])
f(j)=sum([in_bin(x, j) for x in data])/n
h(x)=sum([f(j)/size_bin(j) * in_bin(x, j) for j in 1:L])

x_grid=-4:0.01:4
histogram(data, normed=true, bins=L, label="Built-in histogram",
	c=:blue, la=0, alpha=0.6)
plot!(x_grid, h.(x_grid), lw=3, c=:red, label="Manual histogram",
	xlabel="x", ylabel="Frequency")
plot!(x_grid, pdf.(Normal(), x_grid), label="True PDF",
	lw=3, c=:green, xlims=(-4, 4), ylims=(0, 0.5))
