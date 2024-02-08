using DataFrames, CSV, Dates, StatsBase, Plots, TimeSeries

data=CSV.read("../data/temperatures.csv", copycols=true)
brisbane=data.Brisbane
data=[Date(
		Year(data.Year[i]),
		Month(data.Month[i]),
		Day(data.Day[i])
	)]

window1, window2=7, 14
d1=values(moving(mean, TimeArray(dates, brisbane), window1))
d2=values(moving(mean, TimeArray(dates, brisbane), window2))

grid=(2π:-2π/365:0).+π/2
months_names=Dates.monthname.(dates[1:31:365])

plot(grid, d1[1:365],
	c=:blue, proj=:polar, label="Brisbane weekly average temp.")
plot!(grid, d2[1:365,
	xticks=([mod.((11π/6:-pi/6:0).+π/2,2π);], months_names),
	c=:red, proj=:polar,
	label="Brisbane fortnightly average temp.", legend=outerbottom)
