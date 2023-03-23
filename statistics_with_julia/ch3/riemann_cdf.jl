using Plots, LaTeXStrings

#Something doesn't work here, plot's fucked up

f2(x)=(x<0 ? x+1 : 1-x)*(abs(x)<1 ? 1 : 0)
a, b=-1.5, 1.5
delta=0.01

F(x)=sum([f2(x)*delta for u in a:delta:x])

xgrid=a:delta:b
y=[F(u) for u in xgrid]
plot(xgrid, y, c=:blue, xlims=(a,b), ylims=(0,1), xlabel=L"x", ylabel=L"F(x)", legend=:none)
