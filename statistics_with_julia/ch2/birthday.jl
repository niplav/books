using StatsBase, Combinatorics, Plots; pyplot()

match_exists_1(n)=1-prod([k/365 for k in 365:-1:365-n+1])
match_exists_2(n)=1-factorial(365,365-big(n))/365^big(n)

function bd_event(n)
	birthdays=rand(1:365,n)
	daycounts=counts(birthdays, 1:365)
	return maximum(daycounts)>1
end

probest(n)=sum([bd_event(n) for _ in 1:N)/N

xgrid=1:50
analytic_solution_1=[match_exists_1(n) for n in xgrid)
analytic_solution_2=[match_exists_2(n) for n in xgrid)

println("Maximum error: $(maximum(abs.(analytic_solution_1-analytic_solution_2)))")

N=10^3
mcestimates=[probest(n) for n in xgrid]

plot(xgrid, analytic_solution_1, c=:blue, label="Analytic solution")
scatter!(xgrid, mcestimates, c=:red, ms=6, msw=0, shape=:xcross,
	label="MC estimate", xlims=(0,50), ylims=(0,1),
	xlabel="Number of people in room",
	ylabel="Probability of birthday match",
	legend=:topleft)
