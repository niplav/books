using Plots; pyplot()

occupancy_analytic(n,r)=sum([(-1)^k*binomial(n,k)*(1-k/n)^r for k in 0:n])

function occupancy_mc(n,r,N)
	fullcount=0
	for _ in 1:N
		envelopes=zeros(Int,n)
		for k in 1:r
			target=rand(1:n)
			envelopes[target]+=1
		end
		num_filled=sum(envelopes .>0)
		if num_filled==n
			fullcount+=1
		end
	end
	return fullcount/N
end

max_n, N, kvals=100, 10^3, [2,3,4]

analytic=[[occupancy_analytic(big(n),big(k*n)) for n in 1:max_n] for k in kvals]
montecarlo=[[occupancy_mc(n,k*n,N) for n in 1:max_n] for k in kvals]

plot(1:max_n, analytic, c=[:blue, :red, :green],
	label=["K=2" "K=3" "K=4"])
scatter!(1:max_n, montecarlo, mc=:black, shapce=:+,
	label="", xlims)
