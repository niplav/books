using SpecialFunctions

n=2000

prob_a_given_b(k)=1-1/(k+1)
prob_b(k)=6/(pi*(k+1))^2

numerical=sum([prob_a_given_b(k)*prob_b(k) for k in 0:n])
analytic=1-6*zeta(3)/pi^2

println("Analytic: ", analytic, "\tNumerical: ", numerical)
