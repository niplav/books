using Random
Random.seed!(1)

numbers=10:25
N=10^7

first_digit(x)=Int(floor(x/10))
second_digit(x)=x%10

num_thirteen, num_firstone, num_secondthree=0, 0, 0

for _ in 1:N
	X=rand(numbers)
	global num_thirteen+=X==13
	global num_firstone+=first_digit(X)==1
	global num_secondthree+=second_digit(X)==3
end

prob_thirteen, prob_firstone, prob_secondthree=(num_thirteen, num_firstone, num_secondthree)./N

println("P(13)=", round(prob_thirteen, digits=4),
	"\nP(1_)=", round(prob_firstone, digits=4),
	"\nP(_3)=", round(prob_secondthree, digits=4),
	"\nP(1_)*P(_3)=", round(prob_firstone*prob_secondthree, digits=4))
