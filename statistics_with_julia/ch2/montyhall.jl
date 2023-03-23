using Random
Random.seed!(1)

function monty_hall(switch_policy)
	prize, choice=rand(1:3), rand(1:3)
	if prize==choice
		revealed=rand(setdiff(1:3, choice))
	else
		revealed=rand(setdiff(1:3, [prize, choice]))
	end

	if switch_policy
		choice=setdiff(1:3, [revealed, choice])[1]
	end
	return choice==prize
end

N=10^6
println("Success probability with policy I (stay): ", sum([monty_hall(false) for _ in 1:N])/N)
println("Success probability with policy II (switch): ", sum([monty_hall(true) for _ in 1:N])/N)
