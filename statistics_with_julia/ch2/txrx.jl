using Random
Random.seed!(1)

N=10^5
prob1=0.7
eps0, eps1=0.1, 0.05

flip_with_prob(bit, prob)=rand()<prob ? xor(bit,1) : bit

tx_data=rand(N).<prob1
rx_data=[x==0 ? flip_with_prob(x, eps0) : flip_with_prob(x, eps1) for x in tx_data]

num_tx1=0
total_rx1=0
for i in 1:N
	if rx_data[i]==1
		global total_rx1+=1
		global num_tx1+=tx_data[i]
	end
end

monte_carlo=num_tx1/total_rx1
analytic=((1-eps1)*0.7)/((1-eps1)*0.7+0.3*eps0)

println("Monte Carlo: ", monte_carlo, "\t\tAnalytic: ", analytic)
