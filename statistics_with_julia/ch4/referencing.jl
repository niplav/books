using DataFrames, CSV
data=CSV.read("../../../site/data/daygame_approaches.csv", DataFrame; copycols=true)

println("Attractiveness of first approach: ", data[1,3],
	", ", data[1, :Attractiveness],
	", ", data.Attractiveness[1], "\n")
println(data[[1,2,4], :], "\n")
println(data[13:15, :Location], "\n")
println(data.Location[13:15], "\n")
println(data[13:15, [:Location]], "\n")
