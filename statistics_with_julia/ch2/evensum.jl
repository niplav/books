N, faces=10^6, 1:6

numsol=sum([iseven(i+j) for i in faces, j in faces])/length(faces)^2
mcest=sum([iseven(rand(faces)+rand(faces)) for i in 1:N])/N

println("Numerical solution=$numsol\nMonte Carlo estimate=$mcest")
