# Import libraries.
using Turing, StatsPlots, Random

# Set the true probability of heads in a coin.
p_true = 0.5

# Iterate from having seen 0 observations to 100 observations
Ns = 0:100

# Draw data from a Bernoulli distribution, i.e. draw heads or tails.
Random.seed!(12)
data = rand(Bernoulli(p_true), last(Ns))

# Declare our Turing model.
@model function coinflip(y)
	# Our prior belief about the probability of heads in a coin.
	p ~ Beta(1, 1)

	# The number of observations.
	N = length(y)
	for n in 1:N
		# Hedas or tails of a coin are drawn from a Bernoulli distribution.
		y[n] ~ Bernoulli(p)
	end
end

# Settings of the Hamiltonin Monte Carlo (HMC) sampler.
iterations = 1000
ε = 0.05
τ = 10

# Start sampling.
chain = sample(coinflip(data), HMC(ε, τ), iterations)

# Plot a summary of the sampling process for the parameter p, i.e. the probability of heads in a coin.
histogram(chain[:p])
