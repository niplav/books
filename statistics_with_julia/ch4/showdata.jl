using DataFrames, CSV

data=CSV.read("../../../site/data/daygame_approaches.csv", DataFrame; copycols=true)

println(size(data), "\n")
println(names(data), "\n")
println(first(data, 6), "\n")
println(describe(data), "\n")
