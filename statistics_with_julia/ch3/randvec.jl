using Distributions, LinearAlgebra, LaTeXStrings, Random, Plots
Random.seed!(1)

N=10^5
sig_y=[6 4;
	4 9]
mu_y=[15;
	20]
A=cholesky(sig_y).L

rng_gens=[()->rand(Normal()),
	()->rand(Uniform(-sqrt(3),sqrt(3))),
	()->rand(Exponential())-1]
rv(rg)=A*[rg(),rg()]+mu_y
data=[[rv(r) for _ in 1:N] for r in rng_gens]

stats(data)=begin
	data1, data2=first.(data), last.(data)
	println(round(mean(data1), digits=2), "\t", round(mean(data2), digits=2), "\t",
	round(var(data1), digits=2), "\t", round(var(data2), digits=2), "\t",
	round(cov(data1, data2), digits=2))
end

println("Mean1\tMean2\tVar1\tVar2\tCov")
for d in data
	stats(d)
end

p1=scatter!(first.(data[1]), last.(data[1]), c=:blue, ms=1, msw=0, label="Normal")
p2=scatter!(first.(data[2]), last.(data[2]), c=:red, ms=1, msw=0, label="Uniform")
p3=scatter!(first.(data[3]), last.(data[3]), c=:green, ms=1, msw=0, label="Exponential",
	xlims=(0,40), ylims=(0,40), legend=:bottomright, ratio=:equal,
	xlabel=L"X_1", ylabel=L"X_2")
