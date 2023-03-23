using StatsBase, Random
Random.seed!(1)

grade=["A", "B", "C", "D", "E"]
weight_vect=Weights([0.1, 0.2, 0.1, 0.2, 0.4])

N=10^6
data=sample(grade, weight_vect, N)
print([count(i->(i==g), data) for g in grade]/N)
