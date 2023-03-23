using Distributions, StatsBase, Random
Random.seed!(1)

dist1=TriangularDist(0, 10, 5)
dist2=DiscreteUniform(1, 5)
theor_mean1, theor_mean2=mean(dist1), mean(dist2)

N=10^6
data1=rand(dist1, N)
data2=rand(dist2, N)
est_mean1, est_mean2=mean(data1), mean(data2)

println("Symmetric Triangular Distribution on [0, 10] has mean $theor_mean1 (estimated: $est_mean1)")
println("Discrete Uniform Distribution on [0, 10] has mean $theor_mean2 (estimated: $est_mean2)")
