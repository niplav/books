using Plots, Measures

p_discrete=[0.25, 0.25, 0.5]
xgrid_d=0:2

p_cont(x)=3/4*(1-x^2)
xgrid_c=-1:0.01:1

p_cont2(x)=x<0 ? x+1 : 1-x
p1=plot(xgrid_d, line=:stem, p_discrete, marker=:circle, c=:blue, ms=6, msw=0)
p2=plot(xgrid_c, p_cont.(xgrid_c), c=:blue)
p3=plot(xgrid_c, p_cont2.(xgrid_c), c=:blue)

plot(p1, p2, p3, playout=(1,3), legend=false, ylims=(0,1.1), xlabel="x", ylabel=["Probability" "Density" "Density"], size=(1200, 400), margin=5mm)
