using Distributions, Statistics, Plots

dist1=TriangularDist(0, 1, 1)
dist2=TriangularDist(0, 1, 0)
N=10^6

data1, data2=rand(dist1, N), rand(dist2, N)
datasum=data1+data2

mgf(s)=4(1+(s-1)*MathConstants.e^s)*(MathConstants.e^s-1-s)/s^4
mgf_point_est(s)=mean([MathConstants.e^(s*z) for z in rand(dist1, 20)+rand(dist2, 20)])

p1=histogram(datasum, bins=80, normed=:true, ylims=(0, 1.4), xlabel="z", ylabel="PDF")

sgrid=-1:0.01:1
p2=plot(sgrid, mgf_point_est.(sgrid), c=:blue, ylims=(0, 3.5))
p2=plot!(sgrid, mgf.(sgrid), c=:red)
p2=plot!([minimum(sgrid), maximum(sgrid)],
	[minimum(sgrid), maximum(sgrid)].+1,
	c=:black, xlabel="s", ylabel="MGF")

#plot(p1, p2, legend=:none, size=(800, 400))
