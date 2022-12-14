using StatsBase, Plots; pyplot()

function proportion_fished(gf, sf, n, N, replacement=false)
	function fishing()
		fish_in_pond=[ones(Int64, gf); zeros(Int64, sf)]
		fish_caught=Int64[]

		for fish in 1:n
			fished=rand(fish_in_pond)
			push!(fish_caught, fished)
			if replacement==false
				deleteat!(fish_in_pond, findfirst(x->x==fished, fish_in_pond))
			end
		end
		sum(fish_caught)
	end

	simulations=[fishing() for _ in 1:N]
	proportions=counts(simulations, 0:n)/N

	if replacement
		plot!(0:n, proportions,
			line=:stem, markers=:circle, c=:blue, ms=6, msw=0,
			label="With replacement"
			xlabel="n",
			ylim=(0, 0.6), ylabel="Probability")
	else
		plot!(0:n, proportions,
			line=:stem, marker=:xcross, c=:red, ms=6, msw=0,
			label="Without replacement")
	end
end

N=10^6
goldfish, silverfish, n=3,4,3
plot()
proportion_fished(goldfish, silverfish, n, N)
proportion_fished(goldfish, silverfish, n, N, true)
