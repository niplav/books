using Random, StatsBase, Combinatorics
Random.seed!(1)

function set_allmiss(n)
	omega=collect(permutations(1:n))
	match_events=[]
	for i in 1:n
		event=[]
		for p in omega
			if p[i]==i
				push!(event, p)
			end
		end
		push!(match_events, event)
	end
	no_match=setdiff(omega, union(match_events...))
	return length(no_match)/length(omega)
end

function mc_allmiss(n,N)
	function envelope_stuffer()
		envelopes=Random.shuffle!(collect(1:n))
		return sum([envelopes[i]==i for i in 1:n])==0
	end

	data=[envelope_stuffer() for _ in 1:N]
	return sum(data)/N
end

formula_allmiss(n)=sum([(-1)^k/factorial(k) for k in 0:n])

N=10^6

println("n\tBrute Force\tFormula\t\tMonte Carlo\tAsymptotic",)
for n in 1:6
	brute_force=set_allmiss(n)
	from_formula=formula_allmiss(n)
	from_mc=mc_allmiss(n,N)
	println(n, "\t", round(brute_force, digits=4), "\t\t", round(from_formula, digits=4), "\t\t",
		round(from_mc, digits=4), "\t\t", round(1/MathConstants.e, digits=4))
end
