using StatsBase, Plots

faces, N=1:6, 10^6
mc_est=counts(rand(faces, N), faces)/N

plot(faces, mc_est, line=:stem, marker=:circle, c=:blue, ms=10, msw=0, lw=4, label="MC estimate")
plot([i for i in faces], [1/6 for _ in faces], line=:stem, marker=:xcross, c=:red, ms=6, msw=0, lw=2, label="PMF", xlabel="Face number", ylabel="Probability", ylims=(0, 0.22))
