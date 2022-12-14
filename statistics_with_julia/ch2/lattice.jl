using Random, Combinatorics, LaTeXStrings
using Plots; pyplot()
Random.seed!(12)

n, N=5, 10^5

function is_upper(v)
	for i in 1:Int(length(v)/2)
		sum(v[1:2*i-1])>=i ? continue : return false
	end
	return true
end

omega=unique(permutations([zeros(Int,n);ones(Int,n)]))
A=omega[is_upper.(omega)]
pa_1=length(A)/length(omega)

function randomwalk(n)
	x,y=0,0
	path=[]
	while x<n && y<n
		if rand()<0.5
			x+=1
			push!(path,0)
		else
			y+=1
			push!(path,1)
		end
	end
	append!(path, x<n ? zeros(Int64, n-x) : ones(Int64, n-y))
	return path
end

pa_2=sum([is_upper(randomwalk(n)) for _ in 1:N])/N
println("Model I: ", pa_1, "\t Model II: ", pa_2)

function plotpath(v,l,c)
	x,y=0,0
	graphx, graphy=[x], [y]
	for i in v
		if i==0
			x+=1
		else
			y+=1
		end
		push!(graphx, x), push!(graphy,y)
	end
	plot!(graphx, graphy,
		la=0.8, lw=2, label=1, c=c, ration=:equal, legend=:topleft,
		xlims=(0,n), ylims(0,n),
		xlabel=L"East\rightarrow", ylabel=L"North\rightarrow")
end

plot()
plotpath(rand(A), "Upper lattice path", :blue)
plotpath(rand(setdiff(omega, A)), "Non-upper lattice path", :red)
plot!([0,n], [0,n], ls=:dash, c=:black, label="")
