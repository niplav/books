using Distributions, Random
Random.seed!(1)

N=10^6
sig=1.7

data1=sqrt.(-(2*sig^2)*log.(rand(N)))

dist_g=Normal(0, sig)
data2=sqrt.(rand(dist_g,N).^2 + rand(dist_g, N).^2)

dist_r=Rayleigh(sig)
data3=rand(dist_r, N)

print(mean.([data1, data2, data3]))
