using StatsBase, Plots; pyplot()

names=["Mary", "Mel", "David", "John", "Kayley", "Anderson"]
random_name()=rand(names)

X=3:8
N=10^6
sample_lens=[length(random_name()) for _ in 1:N]

display(bar(X, counts(sample_lens)/N, ylims=(0,0.35),
	xlabel="Name length", ylabel="Estimated p(x)", legend=:none))
