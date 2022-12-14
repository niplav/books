using Random
Random.seed!()

passlen, nummatches=8,1
possiblechars=['a':'z'; 'A':'Z'; '0':'9']

correctpwd="3xyZu4vN"

nummatch(loginpwd)=sum([loginpwd[i]==correctpwd[i] for i in 1:passlen])

N=10^7

passwords=[String(rand(possiblechars, passlen)) for _ in 1:N]
numlogs=sum([nummatch(p)>=nummatches for p in passwords])
println("Number of login attempts logged: ", numlogs)
println("Proportion of login attempts logged: ", numlogs/N)
